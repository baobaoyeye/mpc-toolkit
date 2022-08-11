# mpc-toolkit

## 环境初始化

```bash
$ git clone https://github.com/baobaoyeye/mpc-toolkit.git
$ cd mpc-toolkit
```

bazel+clangd生成compile_commands.json 
[compilation-database.html#bazel](https://sarcasm.github.io/notes/dev/compilation-database.html#bazel) 
[bazel-compile-commands-extractor](https://github.com/hedronvision/bazel-compile-commands-extractor)

```bash
# 生成在根目录生成 compile_commands.json
$ bazel run @hedron_compile_commands//:refresh_all
```

## 编译构建

```bash
# 全部编译
$ bazel build //... -c dbg
```
