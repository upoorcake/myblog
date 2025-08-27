---
title: 合成OCR数据
date: 2025-08-26 21:30:07
tags:
  - PaddleOCR
  - trdg
  - 数据合成/生成
  - TextRecognitionDataGenerator
categories:
  - PaddleOCR 
  - 数据合成
cover: http://img.upoorcake.cn/upoorcake/202508231032679.jpg
description:
---

# 合成OCR数据

## 概述

PaddleOCR 进行训练的时候2000张标注数据泛化差，非常容易过拟合。即使增加数据增强也于事无补。因此需要合成数据增加训练数据量。也可以分成两步走 ，用合成数据进行模型场景迁移。后面再用标注的真实数据进行微调训练。 因此数据合成就必不可少了

这里使用[TextRecognitionDataGenerator](https://github.com/Belval/TextRecognitionDataGenerator)进行数据合成 原因嘛 因为他的github星标比较多。看起来好用一些 

## 详细步骤

### 步骤一：使用anaconda 下载TextRecognitionDataGenerator


直接安装似乎有点问题  我推荐下载源码 然后 我用的是python3.9
```
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

即使是这样 也是有版本问题 修改 requirements.txt 内容 因为我安装过了 ，时间有点久忘记是哪个组件版本有问题 直接把我修改后的requirements.txt内容贴上

```
Pillow>=10.0.0
requests>=2.20.0
opencv-python>=4.2.0.32
tqdm>=4.23.0
diffimg==0.2.3
arabic-reshaper>=2.1.4
python-bidi==0.4.2
wikipedia>=1.4.0

```
### 步骤二：准备背景图

环境安装好之后我们不着急写脚本，还需要准备数据合成的背景素材。我这地方是做钢板号的识别，所以网上找了一些钢板表面缺陷图用着，但绝对不好用，此处不多赘言。自己准备吧，推荐真实应用场景作为背景。这样迁移训练后场景图片的背景，纹理，字符格式都可以迁移。实际应用会有比较好的效果

把我找的钢板表面缺陷图数据集也贴上吧：
[东北大学主页平台 宋克臣--中文主页--NEU surface defect database](http://faculty.neu.edu.cn/songkechen/zh_CN/zdylm/263270/list/index.htm)



### 步骤三：准备字体文件

1. 查看你的识别目标字体，网上找到相似的字体文件。我这边是淘宝买的10块钱，咱也不藏私，分享出来，这里图片是淘宝拷来的 我大概看也一下都有 还是挺良心的

	![image.png](http://img.upoorcake.cn/upoorcake/202508262151789.png)

	链接：https://pan.quark.cn/s/a63a657b64c6?pwd=wgUB
	提取码：wgUB

	如果是非工业领域的朋友这里也提供几个免费的字体下载网站，都是找资源的时候找到的。可惜没有工业喷印字体，但不能浪费：
		1. [字体库 - 高品质免费字体下载 \| 字体大全网 - 字体库](https://zitiku.org/)
		2. [Free Font - 收录商用免费字体(汉字英文字体,Google font)](https://font.icu/)
		3. [猫啃网，最新最全的无版权可免费商用中文字体下载网站!](https://www.maoken.com/)

### 步骤四：写脚本

脚本可以直接让AI写，然后自己再改改 我就直接贴了。需要注意字体文件地址，背景图片地址等等自己看吧：

```
import os

import random

import string

import subprocess

from pathlib import Path

  

# ================== 配置参数 ==================

FONT_DIR = "fonts"

TEXTURE_DIR = "images"

SYNTHETIC_DIR = "output/image"    

LABEL_FILE = "output/train.txt"

  

NUM_IMAGES = 50000

  

FONTS = [

    "正双排方点阵289-6.otf"

]

  

TEXTURE_EXTS = ['.jpg', '.jpeg', '.png']

CLEAR_EXISTING = True

  

# ==============================================

  

def get_files_in_dir(directory, extensions):

    if not os.path.exists(directory):

        raise FileNotFoundError(f"目录不存在: {directory}")

    lower_extensions = [ext.lower() for ext in extensions]

    files = []

    for f in os.listdir(directory):

        file_path = Path(f)

        if file_path.suffix.lower() in lower_extensions:

            files.append(f)

  

    if not files:

        raise FileNotFoundError(f"在 {directory} 中未找到指定类型的文件。请检查字体文件是否存在且扩展名为 {extensions} (或其小写形式)。")

    return [os.path.join(directory, f) for f in files]

  
  

def random_suffix(length=6):

    chars = string.ascii_uppercase + string.digits + '-'

    return ''.join(random.choices(chars, k=length))

  

def generate_text():

    # 此函数生成的是原始的、带有空格的 OCR 目标文本

    plate_number = ''.join(random.choices('0123456789', k=14))

    return f"{plate_number} UT {random_suffix()}"

  
  

def main():

    # 创建目录

    os.makedirs(SYNTHETIC_DIR, exist_ok=True)

    os.makedirs(os.path.dirname(LABEL_FILE), exist_ok=True)

  

    # 清空已有文件（可选）

    if CLEAR_EXISTING:

        for f in os.listdir(SYNTHETIC_DIR):

            fp = os.path.join(SYNTHETIC_DIR, f)

            if os.path.isfile(fp):

                os.remove(fp)

        print(f"🧹 已清空 {SYNTHETIC_DIR}")

  

    relative_font_paths = get_files_in_dir(FONT_DIR, ['.otf'])

    font_paths_for_trdg = [os.path.abspath(p) for p in relative_font_paths]

    texture_paths = get_files_in_dir(TEXTURE_DIR, TEXTURE_EXTS)

  

    print(f"✅ 找到 {len(font_paths_for_trdg)} 个字体")

    print(f"✅ 找到 {len(texture_paths)} 个背景纹理")

  

    # --- 开始修改部分：处理文件名中的空格 ---

    temp_label_file = "temp_labels.txt"

    # 1. 生成原始的、带有空格的标签文本列表

    original_labels_with_spaces = [generate_text() for _ in range(NUM_IMAGES)]

    # 2. 创建一个映射，将带有下划线的文本（用于文件名）映射回原始带有空格的文本（用于真实标签）

    underscore_to_original_map = {}

    labels_for_trdg_temp_file = [] # 这个列表中的文本将会把空格替换为下划线

    for label_with_spaces in original_labels_with_spaces:

        # 替换空格为下划线，作为 TRDG 生成文件名时使用的文本

        label_with_underscores = label_with_spaces.replace(' ', '_')

        labels_for_trdg_temp_file.append(label_with_underscores)

        underscore_to_original_map[label_with_underscores] = label_with_spaces

  

    # 3. 将带有下划线的文本写入临时文件，供 TRDG 读取并作为文件名的一部分

    with open(temp_label_file, 'w', encoding='utf-8') as f:

        for label_for_filename in labels_for_trdg_temp_file:

            f.write(label_for_filename + '\n')

    print(f"📝 生成临时标签 (用于TRDG文件名，已将空格替换为下划线): {temp_label_file}")

    # --- 结束修改部分 ---

  

    # 构建 TRDG 命令（只生成图像）

    cmd = [

        "python", "-m", "trdg.run",

        "-c", str(NUM_IMAGES),

        "-i", temp_label_file, # TRDG 现在会从这个临时文件读取带下划线的标签

        "--output_dir", SYNTHETIC_DIR,

        "--background", "3",                    # 使用自定义背景

        "--image_dir", os.path.abspath(TEXTURE_DIR),

        "--name_format", "0",                   # TRDG 将使用临时文件中的标签直接命名文件

        "--margin", "10",                       # 增加边距

        "--blur", "2",                          # 轻微模糊

        "--random_blur",

        "--text_color", "#FFFFFF,#EEEEEE,#DDDDDD,#CCCCCC",  # 更接近喷码灰白色

        "--language", "en",

        "--format", "40",

        "--width", "720",

        "--alignment", "1",                     # 左对齐

        "--orientation", "0",                   # 水平文本

    ]

  

    for font_file_path_abs in font_paths_for_trdg:

        cmd.extend(["--font", font_file_path_abs])

    print("🖼️ 正在生成合成图像...")

    print(f"Executing TRDG command: {' '.join(cmd)}")

    try:

        # 为了更好地兼容性，为 subprocess.run 添加编码设置

        subprocess.run(cmd, check=True, encoding='utf-8')

        print("✅ 图像生成完成")

    except subprocess.CalledProcessError as e:

        print(f"❌ 生成失败: {e}")

        print(f"命令执行失败，请检查上面打印的TRDG命令是否正确，以及您的TRDG环境。")

        return

  

    print("✅ 开始生成 PaddleOCR 标签文件...")

  

    # 获取所有生成的图片。此时，这些图片的文件名已经包含下划线。

    generated_files = [f for f in os.listdir(SYNTHETIC_DIR) if f.endswith('.jpg')]

    if len(generated_files) == 0:

        print(f"❌ 错误：在 {SYNTHETIC_DIR} 中未找到任何 .jpg 文件")

        return

  

    matched_count = 0

    with open(LABEL_FILE, 'w', encoding='utf-8') as f:

        for img_name in generated_files:

            # 从文件名中提取带有下划线的文本部分 (例如: "123_UT_ABC_0.jpg" -> "123_UT_ABC")

            if '_' in img_name:

                text_part_from_filename_underscored = img_name.rsplit('_', 1)[0]

                # 使用映射表，将带下划线的文本转换回原始带空格的标签文本

                original_label_with_spaces = underscore_to_original_map.get(text_part_from_filename_underscored)

  

                if original_label_with_spaces is None:

                    print(f"⚠️ 无法找到匹配的原始标签用于文件: {img_name}")

                    continue

  

                # 构造图像路径，此时路径中文件名已是带下划线的

                img_path = os.path.join("synthetic", img_name).replace("\\", "/")

                # 写入 PaddleOCR 要求的格式：路径（无空格）\t标签（有空格）

                f.write(f"{img_path}\t{original_label_with_spaces}\n")

                matched_count += 1

            else:

                print(f"⚠️ 跳过无法解析的文件 (无下划线分隔符): {img_name}")

  

    print(f"✅ 成功生成 {matched_count} 条标签到 {LABEL_FILE}")

    print(f"📊 共找到 {len(generated_files)} 张图像，其中 {matched_count} 张已成功写入标签文件。")

  

    # 可选：清理临时文件

    if os.path.exists(temp_label_file):

        os.remove(temp_label_file)

        print(f"🗑️ 已清理临时文件: {temp_label_file}")

  

if __name__ == "__main__":

    main()
```


### 步骤五：运行生成

![image.png](http://img.upoorcake.cn/upoorcake/202508262213885.png)

![8_06094682376206 UT 99L0TJ.jpg](http://img.upoorcake.cn/upoorcake/202508262214136.jpg)

第一张图试运行的状态图 

第二张图是生成的结果图 示例

下面是生成的标签文件 符合PaddleOCR使用的格式

![image.png](http://img.upoorcake.cn/upoorcake/202508271612552.png)


