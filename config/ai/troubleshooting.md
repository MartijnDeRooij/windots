
# Troubleshooting

<details>

<summary>🪟 <b>Odysseus + Docker</b></summary>

## Odysseus cannot connect to Ollama

Restart Ollama correctly:

```bash
pkill ollama

export OLLAMA_HOST=0.0.0.0:11434

ollama serve
```

Then verify:

```bash
curl http://localhost:11434/api/tags
```

---

## Docker cannot reach Ollama

Check binding:

```bash
ss -tulpn | grep 11434
```

If you see:

```text
127.0.0.1:11434
```

that's the problem.

You must see:

```text
0.0.0.0:11434
```

---

## Docker daemon unavailable

```bash
sudo systemctl start docker
```

---

## Docker Compose missing

```bash
sudo apt install docker-compose-plugin
```

---

<br>

</details>

<details>

<summary>🪟 <b>WSL + GPU</b></summary>

Running a local AI model inside **Docker → WSL2 → Ubuntu → Windows** adds several layers where performance can bottleneck. The most common causes are:

## The model is running on CPU instead of GPU

This is by far the biggest cause of poor performance.

Check inside the container:

### NVIDIA

```bash
nvidia-smi
```
If you get an error or no GPU appears, your model is likely running entirely on the CPU.

#### Verify Docker GPU access

On Windows:

```powershell
docker run --rm --gpus all nvidia/cuda:12.9.0-base-ubuntu22.04 nvidia-smi
```

If that doesn't show your GPU, fix GPU passthrough first.

Requirements:

* Recent NVIDIA driver on Windows
* WSL2 enabled
* Docker Desktop with GPU support enabled
* NVIDIA Container Toolkit support

### AMD GPU (WSL2) quick checks

#### Important note

- There is NO `nvidia-smi` equivalent for AMD in WSL.
- AMD ROCm GPU compute in WSL is limited and not supported for many GPUs.

For example the RX 6000 series

- AMD Radeon RX 6000-serie (RDNA2) is **not officially supported for ROCm compute in WSL**
- Result: ROCm tools fail even if GPU is visible to WSL https://rocm.docs.amd.com/projects/radeon-ryzen/en/docs-6.1.3/docs/compatibility/wsl/wsl_compatibility.html


1. WSL GPU passthrough (must exist)
ls /dev/dxg
- If `/dev/dxg` exists → GPU is exposed to WSL

2. WSL graphics stack
ls /usr/lib/wsl/lib

3, DXCore visibility
ldconfig -p | grep dxcore
- If `libdxcore.so` exists → WSL graphics layer is active

4. ROCm compute check (often fails on AMD in WSL)
rocminfo
rocm-smi
- If `rocminfo` shows "ROCk module is NOT loaded" → ROCm compute is NOT working

---

<br>

</details>

<details>

<summary>🪟 <b>WSL + Memory</b></summary>

## WSL2 memory limits are too low

Check memory:

```bash
free -h
```

WSL2 may not be using all available RAM.

In Windows create/edit:

```text
%UserProfile%\.wslconfig
```

Example:

```ini
[wsl2]
memory=32GB
processors=12
swap=16GB
```

Then:

```powershell
wsl --shutdown
```

Restart WSL.

If your model is larger than available RAM/VRAM, performance can collapse due to swapping.

---

<br>

</details>


<details>

<summary>🪟 <b>GPU + Model Size</b></summary>

## Model doesn't fit into VRAM

Check:

```bash
nvidia-smi
```

Look for:

* GPU memory used
* GPU utilization

Symptoms:

* GPU memory almost full
* Low GPU utilization
* High system RAM usage

Example:

* 14B model on an 8GB GPU
* 70B model on a 24GB GPU

The model spills to system RAM and becomes dramatically slower.

Possible fixes:

* Use a smaller quantization (Q4, Q5)
* Use a smaller model
* Increase GPU offload layers (llama.cpp)
* Use a GPU with more VRAM

model that's simply too large

As a rough guide:

| GPU VRAM | Comfortable models |
| -------- | ------------------ |
| 8 GB     | 7B Q4              |
| 12 GB    | 8B–14B Q4          |
| 16 GB    | 14B–32B Q4         |
| 24 GB    | 32B–70B Q4         |
| 48+ GB   | Large MoE and 70B+ |

---

## Useful diagnostics

Run these and share the output:

```bash
nvidia-smi
```

```bash
free -h
```

```bash
nproc
```

```bash
docker stats
```

Then with the following information the bottleneck can be found:

1. GPU model
2. CPU model
3. RAM amount
4. AI software (Ollama, Open WebUI, vLLM, llama.cpp, etc.)
5. Model name (e.g. Qwen3-32B, Llama 3.3 70B, Gemma 3 12B)

---

<br>

</details>

<details>

<summary>🪟 <b>Docker Volume + Windows</b></summary>

## Docker volume mounted from Windows filesystem

A surprisingly common issue.

Slow:

```bash
/mnt/c/Models
```

Fast:

```bash
/home/user/models
```

Files stored on the Windows filesystem (`C:` drive) can be significantly slower than files stored directly inside the WSL2 filesystem.

Check:

```bash
pwd
```

If model files live under:

```text
/mnt/c/
```

move them into Linux storage.

---

<br>

</details>

<details>

<summary>🪟 <b>CPU</b></summary>

## Too many CPU threads

Some inference engines actually slow down when thread counts are excessive.

Check current CPUs:

```bash
nproc
```

Experiment with:

```bash
--threads 4
--threads 8
--threads 12
```

instead of:

```bash
--threads 32
```

For many models, fewer threads produce better throughput.
Different runtimes have vastly different performance.

Examples:

* llama.cpp → very fast
* vLLM → excellent for GPUs
* Ollama → generally good
* Transformers without optimization → can be slow

The answer changes depending on the backend.

---

<br>

</details>

<details>

<summary>🪟 <b>Docker resource limits</b></summary>

## Docker resource limits

Check whether the container is restricted:

```bash
docker inspect <container>
```

or

```bash
docker stats
```

Look for:

* CPU capped
* Memory capped
* GPU unavailable

---

<br>

</details>

<details>

<summary>🪟 <b>WSL Fragmentation</b></summary>

## WSL2 virtual disk is full or fragmented

Check:

```bash
df -h
```

If the virtual disk is nearly full, performance can degrade.

---

<br>

</details>

<details>

<summary>🪟 <b>Antivirus Checks</b></summary>


## Windows Defender scanning model files

Large GGUF, safetensors, and cache files can be scanned repeatedly.

Potential improvement:

* Exclude model directories
* Exclude Docker data directories
* Exclude WSL virtual disk files

Windows Defender can noticeably affect model loading and embedding generation.

---

<br>

</details>