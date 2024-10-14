#import "library/slide_template.typ": *

#show "．" : "。"

#show: project.with(
title:"Slide Title", //スライドのタイトル
authors: ("Author1", "Author 2"), //著者名
institutions: ("Nihon University",), //所属
math-font:"Fira Math", //数式フォント
size:24pt,
header-outline:true, //headingにアウトラインの表示(level1のみ)
header-number:false, //節番号を見出しに表示
//footer: [#table(columns:(1fr,1fr), stroke: (top:.1em+white,bottom:0em,left:0em, right:0em), [Authors Name],[Short Title])],
header-numbering_inf:2,
theme: BlackBoard
//margin:(right:20pt,top:10pt, left:20pt, bottom:10pt)
)
//Themeはいまのところ， BlackBoard, default-theme, Simple, Tropical

//これ以降を改変してください


= outline

#slide-outline()


= heading
<head>



- headingを使ってスライドを作ります．
  
  - 箇条書き

  - 箇条書き

  + 番号付きの箇条書き

  + 番号付きの箇条書き

= heading 2


headlineのレベル1のみが上のアウトラインに表示されます．

#slide(title:"スライドのタイトル")[
  
- ```#slide``` でスライドを作ることも可能です．タイトルはtitle, ラベルはslabelの引数を使います
#theorem(label:"lab")[
異なる定理には異なるラベルを付けてください。ラベルが同じだと同じ番号が付きます。
]
]

#slide(title:"スライドのタイトル",level:2)[
  
- レベルを下げると以下の通りです．
#theorem(label:"lab")[
異なる定理には異なるラベルを付けてください。ラベルが同じだと同じ番号が付きます。
]
]
@lab 次のボタンは最初のスライドへ行くボタン #button(<head>)[button]

- 現在のスライド番号は #showslidenumber()
- ラベルを用いてスライド番号を参照可能 #showslidenumber(label:<head>)

#slide(title:"Dynamic Slide")[

- 動的なスライドは```#slide```を使ってください．
#only(1)[二枚目に登場]
#only((1,3))[２枚目と４枚目に登場]
#onlya(2)[3枚目以降に登場]  
#only(2,mode:"t")[
#theorem(label:"la", title:"すごい定理")[
動的スライドでも定理番号は変わりません
]]
#theorem(kind:"定理", label:"ru")[定理にも変えられる]
]


==

次のようなショートカットもできます．
#let teiri(label:label,body) = {theorem(kind:"定理",label:label)[#body]}
#teiri(label:"ya")[定理です]


#metadata("sss") #label("aa")

#slide(title:[Pauseの設定1],level:2)[
スライドめくりの番号指定が面倒ならpauseも使えます． 
#pause[pause1]
#pause[pause2]

]

#slide(title:[Pauseの設定2],level:2)[
  pauseの設定も色々 a#pause(mode:"t")[pauseA]

#pause(mode:"h")[pauseB]

#pause(mode:"t")[#bbox(title:"ただの箱x")[PauseC]]

#bbox(title:"ただの箱",title_color:green,boxcolor:yellow)[箱の中身]


]

= 数式



$
a x^2+2b x+c\

F(x)=sum_(i =1 )^n f_i (x)
$

= code
#import "@preview/codly:0.2.0": *

#let icon(codepoint) = {
  box(
    height: 0.8em,
    baseline: 0.05em,
    image(codepoint)
  )
  h(0.1em)
}

#show: codly-init.with()
#codly(
)

#text(fill:black)[
```python
def function(text):
  for i in range(10):
        print(i)
  return(str(i+1)+"abc"+text)      
```
]

#slide(title:[ 図(CeTZ)])[#context[

https://typst.app/universe/package/cetz/



#let ex(it,n:1) = {}//subs(it,n) 

#columns[
#cetz.canvas({import cetz.chart
let data = (24, 31, 18, 21, 23, 18, 27, 17, 26, 13)
let colors = gradient.linear(red, blue, green, yellow)
chart.piechart(
  data,
  radius: 3.5,
  slice-style: colors,
  inner-radius: .5,
  outer-label: (content: "%",))})

//CeTZ Objectをdynamic slideにするときは次のようにする．
// 1. contextで囲む
// 2. subslide.update(紙芝居の数) で数を指定
// 3. 番号を指定してfonlyで囲む. fonly((指定番号), 内容)とする．
#subslide.update(2)
#cetz.canvas(
{
import cetz.plot
import cetz.draw: *
fonly((0,1,2),plot.plot(size: (8,8), name: "plot",
          x-tick-step: none, y-tick-step: none, {
  plot.add(((0,0), (1,1), (2,.5), (4,3)))
  plot.add-anchor("pt", (1,1))
}))
fonly((1,2),line("plot.pt", ((), "-|", (0,1.5)), mark: (start: ">"), name: "line"))
fonly((2),content("line.end", [Here], anchor: "east", padding: 0))

})



]
]

]


= 参考

#show link: underline

- Polylux: another package for creating slides in Typst\
  - https://typst.app/universe/package/polylux

- #link("https://www.dropbox.com/scl/fi/dz8s2hgp0amouck2apboe/Typst_start.pdf?rlkey=sxr40yzonwuily952jqweaov4&st=0a6zlk55&dl=0")[Typstの使い方]


