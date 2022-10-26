# Multi-Badge_Custom
この作品は ["Voxel Gummi - Multi Badge"](https://booth.pm/ja/items/1174066) からのMIT Licenseに基づいたFork品です。  
変更点は以下の通りです  
- 最大枚数を16枚から32枚に変更。
- 最大写真枚数の変更を明確化。

当方バッチ用途からアルバム用途に変更したため、画像最大数を変更した経緯があり、Fork作品が生まれました。  
今後はLiltoonのようなShader表現を取り入れたい予定です。なおリリースはETAとさせて下さい。

## License
Distributed by https://github.com/waya0125/  
Copyright (c) 2022 wayamoti2015@waya0125  
Licensed under the MIT License in accordance with the above work.  
https://opensource.org/licenses/mit-license.php  

ここから下記は原作元からの引用です。

# Multi Badge
<img src="https://booth.pximg.net/b3160b6b-8c76-4cbb-9a5b-31c80cca3aca/i/1174066/fdbef27c-795d-40a6-8506-e07c141a251c_base_resized.jpg" width="512">
<img src="https://booth.pximg.net/b3160b6b-8c76-4cbb-9a5b-31c80cca3aca/i/1174066/ac72c281-a371-462e-a4a2-1e79af565129_base_resized.jpg" width="512">
「最大で16個のバッジを一つにまとめ、よりスマートにより軽量に！」ハイポリ＆ローポリのバッジ3Dモデル同封しています。

複数のバッジ（画像）を一つのオブジェクト（Material・Mesh）に結合しShaderを使用して切り替えることで軽量化に繋がります。Animation及びAnimatorも使用していません。

同封バッジ3Dモデルポリゴン数  
low △ 142  
High△ 544  

※通常版とBoost版の中身は同じものです。違いはありません。

# 使用方法・注意事項
SampleTexを参考に必要なバッジのテクスチャーを用意してください。

"Emission Texture"も同様な形式で使用することができます。

使用するバッジの数が16種類未満であっても"Max images"の値を変更することで対応することができます。

"Transition Texture"には遷移アニメーションを行うのに必要なルール画像を設定してください。  
また、"Transition Texture Mode"からバッジごとに個別のアニメーションを使用するか一種類のアニメーションをすべてのバッジの遷移アニメーションに使用するか選択できます。  
"Multi"の場合はSampleTexを参考にテクスチャーを用意してください。  
"Single"の場合は4x4のグリッド上に並べた画像ではなく通常の状態のテクスチャーを用意してください。（サンプルは"Single"になっています。）  

"Transition Texture"（ルール画像）に関しては以下の「For You」様をはじめとして、幾つかのページから入手することが出来ます。  
http://4you.bz/rule  

"Change Speed"の値を変更することでバッジの切り替わる速度を変更する事ができます。  
また、"Transition Speed"の値を変更することで遷移アニメーションの速度を変更する事ができます。1に設定すると遷移アニメーションは無効になります。  

↓ルール画像により遷移アニメーションする様子  
https://twitter.com/Feyris77/status/1083804519190818816

# リリースノート
-> 1.0.0 [初期リリース]  
【新機能】  
・色々…  

## License
Copyright (c) 2018 @Feyris77  
Released under the MIT license  
https://opensource.org/licenses/mit-license.php  
