# Main features

- Friendly GUI;
- Change [colorschemes](http://cocopon.me/app/vim-color-gallery/) as you wish ([vim-colorschemes](https://github.com/flazz/vim-colorschemes));
- Code highlighting for: Markdown, Dockerfile, Ruby, Elixir, Python, Java, JavaScript and other languages;
- Visually displays indent levels in code ([vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides));
- Syntax checking ([Synstatic](https://github.com/scrooloose/syntastic));
- Autocomplete ([YouCompleteMe](https://github.com/Valloric/YouCompleteMe));
- View code line diff instantly ([Git Gutter](http://cache.preserve.io/t395mlry/index.html));
- Find patterns through serveral files ([ag.vim](https://github.com/rking/ag.vim));
- Fast fuzzy finder ([CtrlP](https://github.com/kien/ctrlp.vim));
- Easy tab management: Command-number (⌘1, ⌘2 etc), Command-Tab (next tab), Command-Shift-Tab (previous tab).

Give it a try and enjoy :-)

# Screenshot

![Vim screenshot](https://s3-us-west-2.amazonaws.com/tiagopog/GitHub/vimfiles/vim-screenchot.png)


# Installation

```bash
curl -SL https://raw.githubusercontent.com/gifted-24/vim_editor/simplify-setup/vim_setup.sh -o ~/vim_setup.sh
chmod +x ~/vim_setup.sh
./vim_setup.sh
mv ~/vim_setup.sh ~/.vim_setup.sh
```

# vim-colorschemes: 

To change the colorscheme of the vim editor:
- Open the `colorscheme.txt` file in  `~/.vim` and choose any of choice

```bash
vi ~/.vim/colorscheme.txt
```

- Open the `~/.vimrc`. you'll find the colorscheme config on `line 23`. simply replace it, save and exit.

```bash
vi ~/.vimrc
```
