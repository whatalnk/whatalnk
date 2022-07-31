setup
```
gem install toml-rb thor
```

migration
```
# remove unused files
rm -r */target
rm -r */Cargo.lock

# turn parent directory into workspace
thor ws:init

# add packages to workspace
fd --max-depth 1 --type d -E target -X thor ws:add {/}

# rename packages
fd --max-depth 1 --type d -E target -x sd -p -s hello {/} {}/Cargo.toml
```

misc
* src directory moved in recent version of rust; and rust-analyzer cannot find src directory in 1.42.0 
* https://zenn.dev/yajamon/articles/be689814d242f8
```
cd $HOME/.rustup/toolchains/1.42.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust
ln -sv src library
```