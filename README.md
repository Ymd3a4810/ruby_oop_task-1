# 5/19
> 手続き型のコードをOOPに書き直せる
OOPとはオブジェクト指向プログラミング(Object Oriented Programming)


# Ruby Gems
https://rubygems.org/
Rubyのライブラリがおいてあるサイト
JSの場合はnpm(npm)

Gemfileに使いたいライブラリを書いて`bundle install`というコマンドを打つと天秤座ライがインストールされる
インストールが完了しているとライブラリが使える状態になっている
今回はbundle installのときにオプションを指定していないので、グローバルな環境にインストールされています

# rubyの場所を探す
`where ruby`と入力


# 特定のファイルの変更をクリアする
git stash -- lib/shopping_app/cart.rb
git stash -- lib/shopping_app/*


# requireの方法
### require
絶対パスと相対パス両方指定できる
https://docs.ruby-lang.org/ja/latest/method/Kernel/m/require.html

### require_relative
"現在のファイルから"の相対パスで指定できる
https://docs.ruby-lang.org/ja/latest/method/Kernel/m/require_relative.html
