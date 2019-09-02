# Docker Ubuntu Android Builder Image

1. Basic Usages

```bash
docker run -it --rm ${PROJECT_DIR}:/workspace winetree94/ubuntu-android-builder:minimal bash -c "gradle YOUR_COMMAND"
```

2. With Gradle Google Play Publisher