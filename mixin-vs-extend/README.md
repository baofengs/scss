Scss mixin vs extend

## 实验

1. 每个文件使用 sass 生成 1000 个独一无二的类，并且在其中添加有意义的字符串
2. 使用 gzip 压缩

核心代码：

```scss
/* @file mixin.scss */
@mixin foo {
    color: red;
    font-weight: bold;
    line-height: 2;
}

@for $i from 1 through 1000 {
    .#{unique-id()}-#{$i} {
        @include foo;
        content: "ibf#{&}jaslbw";
    }
}
```

```scss
/* @file extend.scss */
%foo {
    color: red;
    font-weight: bold;
    line-height: 2;
}

@for $i from 1 through 1000 {
    .#{unique-id()}-#{$i} {
        @extend %foo;
        content: "ibf#{&}jaslbw";
    }
}
```

### 实验步骤：

**代码准备**

```bash
git clone https://github.com/x-bao/scss.git
cd scss/mixin-vs-exend
```

**命令行压缩**

```bash
sh vs.sh
```

**Nginx 压缩**

配置

```bash
// 加载 nginx 配置
cd /path/to/nginx/conf.d
ln -s /path/to/scss/mixin-vs-extend/nginx.conf .

// 配置 hosts
sudo echo '127.0.0.1   mixin-vs-extend.local' >> /etc/hosts

// 重启 Nginx 服务
nginx -s reload
```

访问：http://mixin-vs-extend.local，控制台查看相关效果

**实验结果**

```bash
====== mixin ======
4.0K    ./mixin.scss
112K    ./mixin.unzip.css
8.0K    ./mixin.css.gz
====== extend ======
4.0K    ./extend.scss
76K     ./extend.unzip.css
16K     ./extend.css.gz
```
