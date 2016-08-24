# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #
#
# 第1フィールド：移行前の状態（番号）
# 第2フィールド：移行後の状態（番号）
# 第3フィールド：イベント（メッセージの入力）
# 第4フィールド：コマンド（メッセージの出力）
#
# モデル
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# モーション
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# 移動と回転
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# サウンド
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# ステージ
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# ライト
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# カメラ
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# 音声認識
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
#
# 音声統合
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# 変数
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# プラグイン
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# その他のイベント
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# その他のコマンド
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)


# 0011-0020 初期化

0	11	<eps>	MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11	12	MODEL_EVENT_ADD|bootscreen	MODEL_ADD|mei|Model\mei\mei.pmd|0.0,0.0,-14.0
12	13	<eps>	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13	14	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14	15	<eps>	STAGE|Stage\buildingKUTC\stage.pmd
15	16	<eps>	MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16	17	<eps>	TIMER_START|bootscreen|1.5
17	2	TIMER_EVENT_STOP|bootscreen	MODEL_DELETE|bootscreen

# 0021-0030 暇な時の行動

2	21	<eps>	TIMER_START|idle1|20
21	22	TIMER_EVENT_START|idle1	TIMER_START|idle2|40
22	23	TIMER_EVENT_START|idle2	TIMER_START|idle3|60
23	1	TIMER_EVENT_START|idle3	VALUE_SET|random|0|100
1	1	RECOG_EVENT_START	MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1	1	TIMER_EVENT_STOP|idle1	MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1	1	TIMER_EVENT_STOP|idle2	MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1	2	TIMER_EVENT_STOP|idle3	MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 挨拶

1	31	RECOG_EVENT_STOP|こんにちは	SYNTH_START|mei|mei_voice_normal|こんにちは。
1	31	RECOG_EVENT_STOP|こんにちわ	SYNTH_START|mei|mei_voice_normal|こんにちは。
1	31	RECOG_EVENT_STOP|おはよう	SYNTH_START|mei|mei_voice_normal|おはようございます。
1	31	RECOG_EVENT_STOP|おはよう,ございます	SYNTH_START|mei|mei_voice_normal|おはようございます。
1	31	RECOG_EVENT_STOP|こんばんは	SYNTH_START|mei|mei_voice_normal|こんばんは。
1	31	RECOG_EVENT_STOP|こんばんわ	SYNTH_START|mei|mei_voice_normal|こんばんは。
31	32	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32	2	SYNTH_EVENT_STOP|mei	<eps>

# 0041-0050 自己紹介

1	41	RECOG_EVENT_STOP|自己紹介	SYNTH_START|mei|mei_voice_normal|メイと言います。
1	41	RECOG_EVENT_STOP|あなた,誰	SYNTH_START|mei|mei_voice_normal|メイと言います。
1	41	RECOG_EVENT_STOP|君,誰	SYNTH_START|mei|mei_voice_normal|メイと言います。
41	42	<eps>	MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42	43	SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43	2	SYNTH_EVENT_STOP|mei	<eps>

# 0051-0060 感謝

1	51	RECOG_EVENT_STOP|ありがと	SYNTH_START|mei|mei_voice_normal|どういたしまして。
1	51	RECOG_EVENT_STOP|ありがとう	SYNTH_START|mei|mei_voice_normal|どういたしまして。
1	51	RECOG_EVENT_STOP|有難う	SYNTH_START|mei|mei_voice_normal|どういたしまして。
1	51	RECOG_EVENT_STOP|有り難う	SYNTH_START|mei|mei_voice_normal|どういたしまして。
51	52	<eps>	MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52	53	SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53	54	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54	2	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 褒め言葉

1	61	RECOG_EVENT_STOP|可愛い	VALUE_EVAL|random|LE|80
1	61	RECOG_EVENT_STOP|かわいい	VALUE_EVAL|random|LE|80
1	61	RECOG_EVENT_STOP|綺麗	VALUE_EVAL|random|LE|80
1	61	RECOG_EVENT_STOP|きれい	VALUE_EVAL|random|LE|80
61	62	VALUE_EVENT_EVAL|random|LE|80|TRUE	SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61	62	VALUE_EVENT_EVAL|random|LE|80|FALSE	SYNTH_START|mei|mei_voice_bashful|ありがとう。
62	63	<eps>	MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63	2	SYNTH_EVENT_STOP|mei	<eps>

# 0071-0090 案内

1	71	RECOG_EVENT_STOP|図書館	MODEL_DELETE|menu
71	72	<eps>	MODEL_ADD|panel|Accessory\map\map_library.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
72	73	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73	74	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74	75	<eps>	SYNTH_START|mei|mei_voice_normal|図書館は、正面から見ると、右前の方向にあります。
75	76	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76	77	<eps>	SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
77	78	<eps>	MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78	79	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79	80	<eps>	SYNTH_START|mei|mei_voice_normal|お解りになりますか？
80	81	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
81	82	<eps>	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
82	83	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0091-0100 別れ

1	91	RECOG_EVENT_STOP|バイバイ	SYNTH_START|mei|mei_voice_normal|さようなら。
1	91	RECOG_EVENT_STOP|さようなら	SYNTH_START|mei|mei_voice_normal|さようなら。
1	91	RECOG_EVENT_STOP|さよなら	SYNTH_START|mei|mei_voice_normal|さようなら。
91	92	<eps>	MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92	2	SYNTH_EVENT_STOP|mei	<eps>

# 0101-0110 ホームページ

1	101	RECOG_EVENT_STOP|ホームページ	EXECUTE|http://www.mmdagent.jp/
#1	101	RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ	EXECUTE|http://www.mmdagent.jp/
101	102	<eps>	SYNTH_START|mei|mei_voice_normal|関西大学のホームページは、http://www.kansai-u.ac.jp/です。
102	2	SYNTH_EVENT_STOP|mei	<eps>

# 0111-0120 画面

1	111	RECOG_EVENT_STOP|フルスクリーン	KEY_POST|MMDAgent|F|OFF
111	112	<eps>	SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112	2	SYNTH_EVENT_STOP|mei	<eps>

# 0121-0122 みやも

1	121	RECOG_EVENT_STOP|話	SYNTH_START|mei|mei_voice_normal|夜にいつまでも付き合ってくれる女性は、モテません。いつでも付き合ってくれて当たり前、希少価値が生まれません。簡単に口説けそうだし、他の場所でも口説かれてそう、と思われることも多く、悪印象です。ノリがいい事で恋愛のチャンスは増えますが、モテるかどうかは別問題。
121	2	SYNTH_EVENT_STOP|mei	<eps>
1	122	RECOG_EVENT_STOP|お腹,すいた	SYNTH_START|mei|mei_voice_normal|男性は、素直な女性が大好きです。デートに連れて行って、素直においしいものをおいしいと嬉しそうにできる女の子がモテます。男慣れしていて、経験値が高い女性よりも、控えめな人生を送って来たであろう女性のほうが喜ばせるかいがありますからね。
122	2	SYNTH_EVENT_STOP|mei	<eps>

# 0131-0200 場所
1	131	RECOG_EVENT_STOP|食堂	MODEL_DELETE|menu
1	131	RECOG_EVENT_STOP|しょくど-	MODEL_DELETE|menu
131	132	<eps>	MODEL_ADD|panel|Accessory\map\index-map.pmd|0.0,-3.0,2.5|0.0,0.0,0.0|ON|mei
132	133	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
133	134	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
134	135	<eps>	SYNTH_START|mei|mei_voice_normal|食堂は、ひたすら奥に突き進んでください。噴水の奥の建物の一階です。
135	136	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
136	137	<eps>	SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
137	138	<eps>	MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
138	139	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
139	140	<eps>	SYNTH_START|mei|mei_voice_normal|お解りになりますか？
140	141	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
141	142	<eps>	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
142	143	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
143	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

1	151	RECOG_EVENT_STOP|あり	MODEL_DELETE|menu
1	151	RECOG_EVENT_STOP|アイス	MODEL_DELETE|menu
1	151	RECOG_EVENT_STOP|あい	MODEL_DELETE|menu
1	151	RECOG_EVENT_STOP|アイスアリーナ	MODEL_DELETE|menu
152	153	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
153	154	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
154	155	<eps>	SYNTH_START|mei|mei_voice_normal|西の口のバス停で降りて右手に進んでください。
155	156	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
156	157	<eps>	SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
157	158	<eps>	MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
158	159	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
159	160	<eps>	SYNTH_START|mei|mei_voice_normal|お解りになりますか？
160	161	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
161	162	<eps>	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
162	163	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
163	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0201-0300 教授

# 0201-0220 宮本

1	201	RECOG_EVENT_STOP|古賀	MODEL_DELETE|menu
1	201	RECOG_EVENT_STOP|古賀、誰	MODEL_DELETE|menu
201	202	<eps>	MODEL_ADD|panel|Accessory\teacher\kogaga.pmd|5.0,6.0,1.0|0.0,0.0,0.0|ON|mei
202	203	<eps>	SYNTH_START|mei|mei_voice_normal|古賀広志教授は、経営情報システム論の研究をされています。情報と職業などの講義を担当しており、とても優しいおっちゃんです。
203	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	204	RECOG_EVENT_STOP|松下	MODEL_DELETE|menu
1	204	RECOG_EVENT_STOP|松下、誰	MODEL_DELETE|menu
204	205	<eps>	MODEL_ADD|panel|Accessory\teacher\matsushita.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
205	206	<eps>	SYNTH_START|mei|mei_voice_normal|松下光範教授は、インタラクティブシステムデザインの研究をされています。インタラクティブアート実習などの講義を担当しており、とても優しいおっちゃんです。
206	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	207	RECOG_EVENT_STOP|米沢	MODEL_DELETE|menu
1	207	RECOG_EVENT_STOP|米沢、誰	MODEL_DELETE|menu
207	208	<eps>	MODEL_ADD|panel|Accessory\teacher\yonezawa.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
208	209	<eps>	SYNTH_START|mei|mei_voice_normal|米澤朋子教授は、コミュニケーションメディア科学や擬人化システムの研究をされています。ヒューマンエージェントインタラクションなどの講義を担当しており、とても優しいお姉さんです。
209	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

# 0221-0240 居林

1	221	RECOG_EVENT_STOP|田中	MODEL_DELETE|menu
1	221	RECOG_EVENT_STOP|田中、誰	MODEL_DELETE|menu
221	222	<eps>	MODEL_ADD|panel|Accessory\teacher\tanaka.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
222	223	<eps>	SYNTH_START|mei|mei_voice_normal|田中しげのり教授。専門は知的情報処理です。関西大学の卒業生で、ベンチャー企業の運営もしておられます。
223	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	224	RECOG_EVENT_STOP|岡田	MODEL_DELETE|menu
1	224	RECOG_EVENT_STOP|岡田、誰	MODEL_DELETE|menu
224	225	<eps>	MODEL_ADD|panel|Accessory\teacher\okada.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
225	226	<eps>	SYNTH_START|mei|mei_voice_normal|岡田ともゆき教授。専門はメディア論と文化社会学です。お茶目なおっちゃんです。
226	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	227	RECOG_EVENT_STOP|浅野	MODEL_DELETE|menu
1	227	RECOG_EVENT_STOP|浅野、誰	MODEL_DELETE|menu
227	228	<eps>	MODEL_ADD|panel|Accessory\teacher\asano.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
228	229	<eps>	SYNTH_START|mei|mei_voice_normal|浅野あきら教授。専門は画像科学、感性科学、色彩学です。多趣味なかたです。
229	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel


# 0241-0260 岩崎

1	241	RECOG_EVENT_STOP|堀	MODEL_DELETE|menu
241	242	<eps>	MODEL_ADD|panel|Accessory\teacher\hori.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
242	243	<eps>	SYNTH_START|mei|mei_voice_normal|堀まさひろ教授。大阪大学出身です。専門は知識情報学でユーザーにとって使いやすいとはなにかを研究しておられます。彼の受け持っているWeb情報システム論は、持ち込みありのテストのためぜひ受けてみてください。
243	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	244	RECOG_EVENT_STOP|森尾	MODEL_DELETE|menu
244	245	<eps>	MODEL_ADD|panel|Accessory\teacher\morio.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
245	246	<eps>	SYNTH_START|mei|mei_voice_normal|森尾ひろあき教授。フロリダアトランティック大学出身です。専門は社会心理学で、社会の中での人間の心の動きを解き明かしていく、ということをされています。彼の受け持っている、インターネットと心理という授業での、人間は顔が全て、イケメンは全てにおいて得をする、というビデオには衝撃を受けました。気になるかたはぜひ関西大学へ。
246	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	247	RECOG_EVENT_STOP|荻野	MODEL_DELETE|menu
247	248	<eps>	MODEL_ADD|panel|Accessory\teacher\ogino.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
248	249	<eps>	SYNTH_START|mei|mei_voice_normal|荻野まさき教授。大阪大学出身です。認知ロボティックスを専門としており、人はどのように認知能力を成長の過程で身につけていくのかを研究しておられます。コンピューターの言語という必修授業を担当しているため、覚えておきましょう。
249	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

# 0261-0280 鈴木雄

1	262	RECOG_EVENT_STOP|加藤	MODEL_DELETE|menu
262	263	<eps>	MODEL_ADD|panel|Accessory\teacher\kato.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
263	264	<eps>	SYNTH_START|mei|mei_voice_normal|加藤隆教授。４月１日生まれ、マサチューセッツ大学心理学科を卒業され、専門領域は、認知社会心理学です。キーワードとして、ヒューマンインタフェース、認知心理学、認知と感情のかかわり、が、あげられます。そして、ダジャレ大好きです。
264	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	1262	RECOG_EVENT_STOP|桑門	MODEL_DELETE|menu
1262	1263	<eps>	MODEL_ADD|panel|Accessory\teacher\kuwakado.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
1263	1264	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
1264	1265	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
1265	1266	<eps>	SYNTH_START|mei|mei_voice_normal|くわかど秀典教授。専門領域は、情報セキュリティーです。
1266	1267	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
1267	1268	<eps>	SYNTH_START|mei|mei_voice_normal|キーワードとして、現代暗号、暗号解読、情報セキュリティー、が、あげられます。
1268	1269	<eps>	MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
1269	1270	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
1270	1271	<eps>	SYNTH_START|mei|mei_voice_normal|そして、Ｃ言語と言ったらこの人です。
1271	1272	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
1272	1273	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
1273	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

1	2262	RECOG_EVENT_STOP|桑原	MODEL_DELETE|menu
2262	2263	<eps>	MODEL_ADD|panel|Accessory\teacher\kuwabara.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
2263	2264	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
2264	2265	<eps>	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
2265	2266	<eps>	SYNTH_START|mei|mei_voice_normal|桑原尚史教授。専門領域は、認知社会心理学です。
2266	2267	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
2267	2268	<eps>	SYNTH_START|mei|mei_voice_normal|キーワードとして、社会的判断、感情喚起過程、会話過程、が、あげられます。
2268	2269	<eps>	MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
2269	2270	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
2270	2271	<eps>	SYNTH_START|mei|mei_voice_normal|そして、この学部の学部長です。
2271	2272	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
2272	2273	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
2273	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0281-0300 鈴木聖

1	281	RECOG_EVENT_STOP|林	MODEL_DELETE|menu
281	282	<eps>	MODEL_ADD|panel|Accessory\teacher\hayashi.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
282	283	<eps>	SYNTH_START|mei|mei_voice_normal|林たけふみ教授。視覚情報処理や、情報の可視化についての専門家です。　また、ＣＧについてのプロです。　授業は生徒思いで優しいです。
283	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	284	RECOG_EVENT_STOP|松本	MODEL_DELETE|menu
284	285	<eps>	MODEL_ADD|panel|Accessory\teacher\matsumoto.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
285	286	<eps>	SYNTH_START|mei|mei_voice_normal|松本わたる教授。調査データの収集と解析の方法論についての専門家です。データや分析についてかなり詳しいです。東大出身です。
286	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

1	287	RECOG_EVENT_STOP|喜多	MODEL_DELETE|menu
287	288	<eps>	MODEL_ADD|panel|Accessory\teacher\kita.pmd|5.0,6.0,3.0|0.0,0.0,0.0|ON|mei
288	289	<eps>	SYNTH_START|mei|mei_voice_normal|喜多ちぐさ教授。インターネット史やコンピューティングの歴史についての専門家です。元ディレクターでテレビや制作の裏側を知る人であるため、テレビ業界について興味があるなら喜多先生についていくべきです。
289	2	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel

# 301-400 サークル
1	301	RECOG_EVENT_STOP|サークル	SYNTH_START|mei|mei_voice_normal|文化系と体育系、どちらが気になりますか？
1	301	KEY|1	SYNTH_START|mei|mei_voice_normal|文化系と体育系、どちらが気になりますか？
301	302	SYNTH_EVENT_STOP|mei	MODEL_DELETE|menu
302	303	<eps>	MODEL_ADD|panel1|Accessory\circle\bunka.pmd|-7.0,5.0,2.5|0.0,0.0,0.0|ON|mei
303	304	MODEL_EVENT_ADD|panel1	MODEL_ADD|panel2|Accessory\circle\taiiku.pmd|7.0,5.0,2.5|0.0,0.0,0.0|ON|mei
304	305	KEY|1	SYNTH_START|mei|mei_voice_normal|文化系サークルはこちらです。
304	305	RECOG_EVENT_STOP|文化	SYNTH_START|mei|mei_voice_normal|文化系サークルはこちらです。
304	305	RECOG_EVENT_STOP|文科	SYNTH_START|mei|mei_voice_normal|文化系サークルはこちらです。
304	306	KEY|2	SYNTH_START|mei|mei_voice_normal|体育系サークル、部活はこちらです。
304	306	RECOG_EVENT_STOP|体育	SYNTH_START|mei|mei_voice_normal|体育系サークル、部活はこちらです。
305	307	<eps>	MODEL_DELETE|panel2
307	308	MODEL_EVENT_DELETE|panel2	MODEL_ADD|panel2|Accessory\circle\bunka_list.pmd|7.0,5.0,2.5|0.0,0.0,0.0|ON|mei
306	309	<eps>	MODEL_DELETE|panel1
309	330	MODEL_EVENT_DELETE|panel1	MODEL_ADD|panel1|Accessory\circle\taiiku_list.pmd|-7.0,5.0,2.5|0.0,0.0,0.0|ON|mei

# 文化系サークル
308	310	KEY|1	MODEL_ADD|panel3|Accessory\circle\banditz.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	310	RECOG_EVENT_STOP|banditz	MODEL_ADD|panel3|Accessory\circle\banditz.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	310	RECOG_EVENT_STOP|軽音	MODEL_ADD|panel3|Accessory\circle\banditz.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
310	311	<eps>	MODEL_DELETE|panel2
311	386	<eps>	SYNTH_START|mei|mei_voice_normal|バンディッツは軽音楽サークルです。月に一回ほど定期ライブをおこなっています。

308	312	KEY|2	MODEL_ADD|panel3|Accessory\circle\gccc.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	312	RECOG_EVENT_STOP|GCCC	MODEL_ADD|panel3|Accessory\circle\gccc.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	312	RECOG_EVENT_STOP|ゲーム	MODEL_ADD|panel3|Accessory\circle\gccc.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
312	313	<eps>	MODEL_DELETE|panel2
313	386	<eps>	SYNTH_START|mei|mei_voice_normal|GCCCはゲーム制作サークルです。プログラミング、グラフィック、作曲などの講習をおこない、ゲームを制作しています。

308	314	KEY|3	MODEL_ADD|panel3|Accessory\circle\iris.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	314	RECOG_EVENT_STOP|あいりす	MODEL_ADD|panel3|Accessory\circle\iris.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	314	RECOG_EVENT_STOP|写真	MODEL_ADD|panel3|Accessory\circle\iris.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
314	315	<eps>	MODEL_DELETE|panel2
315	386	<eps>	SYNTH_START|mei|mei_voice_normal|アイリスは写真サークルです。

308	316	KEY|4	MODEL_ADD|panel3|Accessory\circle\josai.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	316	RECOG_EVENT_STOP|じょうさい	MODEL_ADD|panel3|Accessory\circle\josai.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
316	317	<eps>	MODEL_DELETE|panel2
317	386	<eps>	SYNTH_START|mei|mei_voice_normal|総合情報学部祭典実行委員会、略して情祭では、高槻キャンパス祭、統一祭での管理、運営をしています。毎年みんなに楽しんでもらうために、一体感を大事にして重大な役目をおっています。サークルとしての合宿やイベントも多数あります。

308	318	KEY|5	MODEL_ADD|panel3|Accessory\circle\ktb.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	318	RECOG_EVENT_STOP|KTB	MODEL_ADD|panel3|Accessory\circle\ktb.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	318	RECOG_EVENT_STOP|放送局	MODEL_ADD|panel3|Accessory\circle\ktb.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	318	RECOG_EVENT_STOP|音声	MODEL_ADD|panel3|Accessory\circle\ktb.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
318	319	<eps>	MODEL_DELETE|panel2
319	386	<eps>	SYNTH_START|mei|mei_voice_normal|KTBは放送局です。番組放送や映像制作をおこなっています。

308	320	KEY|6	MODEL_ADD|panel3|Accessory\circle\mcs.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	320	RECOG_EVENT_STOP|MCS	MODEL_ADD|panel3|Accessory\circle\mcs.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	320	RECOG_EVENT_STOP|映像	MODEL_ADD|panel3|Accessory\circle\mcs.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	320	RECOG_EVENT_STOP|ボランティア	MODEL_ADD|panel3|Accessory\circle\mcs.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
320	321	<eps>	MODEL_DELETE|panel2
321	386	<eps>	SYNTH_START|mei|mei_voice_normal|MCSは映像系のボランティア団体です。

308	322	KEY|7	MODEL_ADD|panel3|Accessory\circle\sjm.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	322	RECOG_EVENT_STOP|SJM	MODEL_ADD|panel3|Accessory\circle\sjm.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	322	RECOG_EVENT_STOP|映像制作	MODEL_ADD|panel3|Accessory\circle\sjm.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
322	323	<eps>	MODEL_DELETE|panel2
323	386	<eps>	SYNTH_START|mei|mei_voice_normal|SJMは映像制作団体です。

308	324	KEY|8	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	324	RECOG_EVENT_STOP|そうさくけんきゅうかい	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	324	RECOG_EVENT_STOP|そうけん	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	324	RECOG_EVENT_STOP|イラスト	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	324	RECOG_EVENT_STOP|漫画	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
324	325	<eps>	MODEL_DELETE|panel2
325	386	<eps>	SYNTH_START|mei|mei_voice_normal|創作研究会はイラストや漫画、音楽や小説の創作活動をしています。会報として作品をサークルで発表しあうだけではなく。コミックマーケットやコミックトレジャーで、みんなの作品を外部のかたに知ってもらうための活動もしています。

308	326	KEY|9	MODEL_ADD|panel3|Accessory\circle\vocalise.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	326	RECOG_EVENT_STOP|ボカリーズ	MODEL_ADD|panel3|Accessory\circle\vocalise.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	326	RECOG_EVENT_STOP|アカペラ	MODEL_ADD|panel3|Accessory\circle\vocalise.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
326	327	<eps>	MODEL_DELETE|panel2
327	386	<eps>	SYNTH_START|mei|mei_voice_normal|ボカリーズはアカペラサークルです。毎週きんようびにテラスで集まって、みんなで歌の練習をしたりしています。新歓ライブ、クリスマスライブなど、イベントも多数です。高槻祭だけでなく統一祭などでも活躍しています。

308	328	KEY|0	MODEL_ADD|panel3|Accessory\circle\yorozu.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	328	RECOG_EVENT_STOP|よろずえまき	MODEL_ADD|panel3|Accessory\circle\yorozu.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	328	RECOG_EVENT_STOP|劇団	MODEL_ADD|panel3|Accessory\circle\yorozu.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
308	328	RECOG_EVENT_STOP|演劇	MODEL_ADD|panel3|Accessory\circle\yorozu.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
328	329	<eps>	MODEL_DELETE|panel2
329	386	<eps>	SYNTH_START|mei|mei_voice_normal|劇団よろずえまきは演劇サークルです。とてもアクティブなサークルで、年6回の公演に向けて日々楽しく活動しています。役者だけではなく、ポスター、小道具、服などを作りたい人がスタッフとして仕事をしたり、みんなが得意分野を演劇で生かして活動しています。

#体育系サークル・部活
330	331	KEY|1	MODEL_ADD|panel3|Accessory\circle\aikido.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	331	RECOG_EVENT_STOP|合気道	MODEL_ADD|panel3|Accessory\circle\aikido.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
331	332	<eps>	MODEL_DELETE|panel1
332	385	<eps>	SYNTH_START|mei|mei_voice_normal|そうじょうあいきは、高槻市にある道場の稽古に参加している合気道サークルです。社会人の方々とも交流しながら稽古に励んでいます。

330	333	KEY|2	MODEL_ADD|panel3|Accessory\circle\borabora.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	333	RECOG_EVENT_STOP|ボラボラ	MODEL_ADD|panel3|Accessory\circle\borabora.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	333	RECOG_EVENT_STOP|バレー	MODEL_ADD|panel3|Accessory\circle\borabora.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
333	334	<eps>	MODEL_DELETE|panel1
334	385	<eps>	SYNTH_START|mei|mei_voice_normal|ボラボラは、男女合わせて50人から60人ほどの賑やかなバレーボールサークルです。主に水曜日と土曜日の週2回、高槻キャンパスの体育館で活動しています。

330	335	KEY|3	MODEL_ADD|panel3|Accessory\circle\double.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	335	RECOG_EVENT_STOP|ダブル	MODEL_ADD|panel3|Accessory\circle\double.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	335	RECOG_EVENT_STOP|ダブルタッチ	MODEL_ADD|panel3|Accessory\circle\double.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
335	336	<eps>	MODEL_DELETE|panel1
336	385	<eps>	SYNTH_START|mei|mei_voice_normal|だぶるは、ダブルタッチという縄跳びをするサークルです。週に2回程度、大学院棟前の広場や高槻ミューズキャンパス横の公園にて練習しています。キャンパス祭では毎年パフォーマンスを行います。

330	337	KEY|4	MODEL_ADD|panel3|Accessory\circle\equestrian.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	337	RECOG_EVENT_STOP|馬術部	MODEL_ADD|panel3|Accessory\circle\equestrian.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
337	338	<eps>	MODEL_DELETE|panel1
338	385	<eps>	SYNTH_START|mei|mei_voice_normal|体育会馬術部は、これまでに幾度も全日本学生の大会に出場し、個人や団体で優勝、連覇するなど、全国でも有数の強豪校として名をつらねています。高槻キャンパスの静かな良い環境のもとで活動しています。

330	339	KEY|5	MODEL_ADD|panel3|Accessory\circle\janzies.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	339	RECOG_EVENT_STOP|ジャンジーズ	MODEL_ADD|panel3|Accessory\circle\janzies.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	339	RECOG_EVENT_STOP|野球	MODEL_ADD|panel3|Accessory\circle\janzies.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
339	340	<eps>	MODEL_DELETE|panel1
340	385	<eps>	SYNTH_START|mei|mei_voice_normal|ジャンジーズは、毎週水曜日に他チームとの練習試合を行なったり、春夏秋冬に一回ずつの試合に向けて日々練習をしているアクティブな硬式野球サークルです。夏や年末にみんなで親睦を深めるための楽しいイベントもあります。

330	341	KEY|6	MODEL_ADD|panel3|Accessory\circle\junkeeys.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	341	RECOG_EVENT_STOP|ジャンキース	MODEL_ADD|panel3|Accessory\circle\junkeeys.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	341	RECOG_EVENT_STOP|バスケ	MODEL_ADD|panel3|Accessory\circle\junkeeys.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
341	342	<eps>	MODEL_DELETE|panel1
342	385	<eps>	SYNTH_START|mei|mei_voice_normal|ジャンキースは、バスケットボールサークルです。毎週火曜日に川西体育館で本格的な練習、毎週水曜日と土曜日は大学の体育館でゆるーく活動しています。

330	343	KEY|7	MODEL_ADD|panel3|Accessory\circle\skate.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	343	RECOG_EVENT_STOP|スケート	MODEL_ADD|panel3|Accessory\circle\skate.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
343	344	<eps>	MODEL_DELETE|panel1
344	385	<eps>	SYNTH_START|mei|mei_voice_normal|体育会アイススケート部は、フィギュア部門、スピード部門の2部門に分かれて日々の練習に励んでいます。全国レベルの選手権大会で活躍する部員、大学で競技を初め個々の技術習得を目指す部員など、さまざまなメンバーがいます。

330	345	KEY|8	MODEL_ADD|panel3|Accessory\circle\soleil.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	345	RECOG_EVENT_STOP|ソレイユ	MODEL_ADD|panel3|Accessory\circle\soleil.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	345	RECOG_EVENT_STOP|テニス	MODEL_ADD|panel3|Accessory\circle\soleil.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
345	346	<eps>	MODEL_DELETE|panel1
346	385	<eps>	SYNTH_START|mei|mei_voice_normal|ソレイユは、ソフトテニスサークルです。すいようときんようの週二回あつまって練習をしています。経験者も初心者も、どちらも楽しんで活動をしています。年間イベントも多数行われています。

330	347	KEY|9	MODEL_ADD|panel3|Accessory\circle\tbc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	347	RECOG_EVENT_STOP|ティービーシー	MODEL_ADD|panel3|Accessory\circle\tbc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	347	RECOG_EVENT_STOP|バドミントン	MODEL_ADD|panel3|Accessory\circle\tbc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
347	348	<eps>	MODEL_DELETE|panel1
348	385	<eps>	SYNTH_START|mei|mei_voice_normal|TBCは高槻のバトミントンサークルです。毎週四回の練習を行っています。部員数は200人に及ぶ巨大サークルです。年間イベントも多数あります、長期休暇の遠方への旅行などもあり、サークル内の絆がとても深いです。

330	349	KEY|0	MODEL_ADD|panel3|Accessory\circle\tltc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	349	RECOG_EVENT_STOP|ティーエルティーシー	MODEL_ADD|panel3|Accessory\circle\tltc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	349	RECOG_EVENT_STOP|テニス	MODEL_ADD|panel3|Accessory\circle\tltc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
349	350	<eps>	MODEL_DELETE|panel1
350	385	<eps>	SYNTH_START|mei|mei_voice_normal|TLTCは高槻のテニスサークルです。テニスコートですいようびとどようびにみんなで練習をおこなっています。かようびときんようびにはコート開放で、各自で自由に練習を行うこともできます。

330	351	KEY|^	MODEL_ADD|panel3|Accessory\circle\tsc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	351	RECOG_EVENT_STOP|ティーエスシー	MODEL_ADD|panel3|Accessory\circle\tsc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
330	351	RECOG_EVENT_STOP|サッカー	MODEL_ADD|panel3|Accessory\circle\tsc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
351	352	<eps>	MODEL_DELETE|panel1
352	385	<eps>	SYNTH_START|mei|mei_voice_normal|TSCはサッカーサークルです。毎週すいようびに授業が終わったあと、練習をしています。大会や合宿にも参加しています。サッカーを楽しみたい人や本気で取り組みたい人、どちらも楽しめるサークルです。

385	387	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel2
386	388	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel1
387	389	<eps>	MODEL_DELETE|panel1
388	389	<eps>	MODEL_DELETE|panel2

389	390	<eps>	MODEL_DELETE|panel3
390	391	MODEL_EVENT_DELETE|panel3	SYNTH_START|mei|mei_voice_normal|ほかに気になるサークルはありますか？
391	392	SYNTH_EVENT_STOP|mei	MODEL_ADD|panel1|Accessory\answer\yes.pmd|-7.0,5.0,2.5|0.0,0.0,0.0|ON|mei
392	393	MODEL_EVENT_ADD|panel1	MODEL_ADD|panel2|Accessory\answer\no.pmd|7.0,5.0,2.5|0.0,0.0,0.0|ON|mei
393	394	KEY|Y	MODEL_DELETE|panel2
393	394	RECOG_EVENT_STOP|はい	MODEL_DELETE|panel2
394	395	MODEL_EVENT_DELETE|panel2	MODEL_DELETE|panel1
395	301	<eps>	SYNTH_START|mei|mei_voice_normal|文化系と体育系、どちらが気になりますか？
393	397	KEY|N	MODEL_DELETE|panel1
393	397	RECOG_EVENT_STOP|いいえ	MODEL_DELETE|panel1
397	398	MODEL_EVENT_DELETE|panel1	MODEL_DELETE|panel2
398	399	MODEL_EVENT_DELETE|panel2	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
399	400	MODEL_EVENT_ADD|menu	MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
400	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

#直接入力
1	310	RECOG_EVENT_STOP|banditz	MODEL_ADD|panel3|Accessory\circle\banditz.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	312	RECOG_EVENT_STOP|GCCC	MODEL_ADD|panel3|Accessory\circle\gccc.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	314	RECOG_EVENT_STOP|あいりす	MODEL_ADD|panel3|Accessory\circle\iris.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	316	RECOG_EVENT_STOP|じょうさい	MODEL_ADD|panel3|Accessory\circle\josai.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	318	RECOG_EVENT_STOP|KTB	MODEL_ADD|panel3|Accessory\circle\ktb.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	320	RECOG_EVENT_STOP|MCS	MODEL_ADD|panel3|Accessory\circle\mcs.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	322	RECOG_EVENT_STOP|SJM	MODEL_ADD|panel3|Accessory\circle\sjm.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	324	RECOG_EVENT_STOP|そうさくけんきゅうかい	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	324	RECOG_EVENT_STOP|そうけん	MODEL_ADD|panel3|Accessory\circle\souken.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	326	RECOG_EVENT_STOP|ボカリーズ	MODEL_ADD|panel3|Accessory\circle\vocalise.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	328	RECOG_EVENT_STOP|よろずえまき	MODEL_ADD|panel3|Accessory\circle\yorozu.pmd|5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	331	RECOG_EVENT_STOP|合気道	MODEL_ADD|panel3|Accessory\circle\aikido.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	333	RECOG_EVENT_STOP|ボラボラ	MODEL_ADD|panel3|Accessory\circle\borabora.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	335	RECOG_EVENT_STOP|ダブル	MODEL_ADD|panel3|Accessory\circle\double.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	337	RECOG_EVENT_STOP|馬術部	MODEL_ADD|panel3|Accessory\circle\equestrian.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	339	RECOG_EVENT_STOP|JANZIES	MODEL_ADD|panel3|Accessory\circle\janzies.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	341	RECOG_EVENT_STOP|ジャンキース	MODEL_ADD|panel3|Accessory\circle\junkeeys.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	343	RECOG_EVENT_STOP|スケート	MODEL_ADD|panel3|Accessory\circle\skate.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	345	RECOG_EVENT_STOP|ソレイユ	MODEL_ADD|panel3|Accessory\circle\soleil.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	347	RECOG_EVENT_STOP|ティービーシー	MODEL_ADD|panel3|Accessory\circle\tbc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	349	RECOG_EVENT_STOP|ティーエルティーシー	MODEL_ADD|panel3|Accessory\circle\tltc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei
1	351	RECOG_EVENT_STOP|ティーエスシー	MODEL_ADD|panel3|Accessory\circle\tsc.pmd|-5.0,2.5,2.6|0.0,0.0,0.0|ON|mei

# 0401-0429 Q&A

1	401	RECOG_EVENT_STOP|よく,ある,質問	SYNTH_START|mei|mei_voice_normal|なんでしょう。
401	402	SYNTH_EVENT_STOP|mei	<eps>
402	428	RECOG_EVENT_STOP|コンピュータ,使用	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|コンピューター,使用	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|コンピュータ,しよう	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|コンピューター,しよう	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|コンピュータ,利用	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|コンピューター,利用	SYNTH_START|mei|mei_voice_normal|入学時にIDを与えられるので、授業で使用していないときは、夜の9時半まで自由に教室のコンピュータを利用できます。
402	428	RECOG_EVENT_STOP|資格	SYNTH_START|mei|mei_voice_normal|教職課程が設置され、高校一種「情報」「公民」「数学」の教員免許が取得できます。社会調査の知識や技術を用いて、よろん、市場動向、社会事象等をとらえる調査の専門家「社会調査士」についても、指定科目を修得することで、資格が取得できます。基礎的な力は授業と実習で身につくし、関連する応用科目もあるので、役立つ資格にも取り組みやすいです。
402	428	RECOG_EVENT_STOP|文系	SYNTH_START|mei|mei_voice_normal|大丈夫です。情報イコールコンピューター、理系。と考えられるかもしれませんが、この学部は「総合情報」です。カリキュラムには様々な分野を／複合的に扱う科目もたくさんあります。文系科目中心、理系科目中心、あるいは両方の科目を学んでいくといったように、入学してから自分の興味に応じて組立てることができます。
402	428	RECOG_EVENT_STOP|奨学金	SYNTH_START|mei|mei_voice_normal|関西大学に入学されるかたで、学費の納入が極めて困難なかたのために、合格発表時に出願可能な「関西大学入学時貸与奨学金」を設けています。入学後は「日本学生支援機構奨学金」「関西大学奨学金」「地方自治体・財団奨学金」等に出願することができ、各種奨学金は学生生活に広く浸透しています。
402	428	RECOG_EVENT_STOP|クラブ	SYNTH_START|mei|mei_voice_normal|体育会、文化会等たくさんのクラブ・サークルがありますが、多くは千里山で活動しています。千里山での活動に参加し、活躍している総合情報学部生もいます。また、高槻で活動している総合情報学部独自のサークルに参加することもできます。高槻キャンパスのアイスアリーナや馬場で、アイススケート部、アイスホッケー部、馬術部といった体育会クラブが活動しています。
402	428	RECOG_EVENT_STOP|サークル	SYNTH_START|mei|mei_voice_normal|体育会、文化会等たくさんのクラブ・サークルがありますが、多くは千里山で活動しています。千里山での活動に参加し、活躍している総合情報学部生もいます。また、高槻で活動している総合情報学部独自のサークルに参加することもできます。高槻キャンパスのアイスアリーナや馬場で、アイススケート部、アイスホッケー部、馬術部といった体育会クラブが活動しています。
402	430	RECOG_EVENT_STOP|ありがと	SYNTH_START|mei|mei_voice_normal|どういたしまして。
402	430	RECOG_EVENT_STOP|ありがとう	SYNTH_START|mei|mei_voice_normal|どういたしまして。
428	429	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
429	402	SYNTH_EVENT_STOP|mei	<eps>
430	2	SYNTH_EVENT_STOP|mei	<eps>

# 0430-0459 カリキュラム

1	430	RECOG_EVENT_STOP|学費	SYNTH_START|mei|mei_voice_normal|年間150万円です。
430	431	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
431	2	SYNTH_EVENT_STOP|mei	<eps>

1	432	RECOG_EVENT_STOP|住所	SYNTH_START|mei|mei_voice_normal|大阪府高槻市霊仙寺町2-1-1です。
432	433	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
433	2	SYNTH_EVENT_STOP|mei	<eps>

1	434	RECOG_EVENT_STOP|マップ	MODEL_DELETE|menu
434	435	<eps>	MODEL_ADD|panel|Accessory\map\campas_map.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
435	436	<eps>	MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
436	437	<eps>	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
437	438	<eps>	SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
438	439	SYNTH_EVENT_STOP|mei	MODEL_DELETE|panel
439	440	<eps>	MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
440	441	<eps>	MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
441	2	<eps>	MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

1	442	RECOG_EVENT_STOP|3つの系	SYNTH_START|mei|mei_voice_normal|総合情報学部は、情報をキーワードとして文系/理系という枠組みにとらわれず、人文・社会・自然科学の3つの分野を、横断的に学べるユニークな学部です。
442	443	SYNTH_EVENT_STOP|mei	MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
443	444	<eps>	SYNTH_START|mei|mei_voice_normal|政治、経済、文化、科学技術、コミュニケーションなどあらゆる領域の問題を「情報」の視点から探究・解明します。
444	445	SYNTH_EVENT_STOP|mei	MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
445	446	<eps>	SYNTH_START|mei|mei_voice_normal|また、理論的知識だけでなく、人間と社会に対する幅広い視野とともに実践的な情報フルエンシー（利活用能力）を身につける教育をおこなっています。
446	447	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
447	2	SYNTH_EVENT_STOP|mei	<eps>

# 0460-0499 実習

1	460	RECOG_EVENT_STOP|実習	SYNTH_START|mei|mei_voice_normal|総合情報学部の実習は，プログラミング実習，映像実習，グラフィックス実習，データリテラシー実習，ネットワーク実習などがあります．
1	460	RECOG_EVENT_STOP|プログラミング	SYNTH_START|mei|mei_voice_normal|プログラミング実習では、C言語を扱って．変数や，演算子や条件分岐，文字列，ポインタ変数．構造体などの基本的なCプログラミング技術の修得を目指します．
1	460	RECOG_EVENT_STOP|グラフィックス	SYNTH_START|mei|mei_voice_normal|グラフィックス基礎実習では，アドビイラストレーターを使って，グラフィックス制作の基礎を身につけます．実際に広告などを作ることで，実践的なデザインリテラシーを修得します。
1	460	RECOG_EVENT_STOP|データリテラシー	SYNTH_START|mei|mei_voice_normal|Excelで頑張る実習です。
460	461	<eps>	MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
461	2	SYNTH_EVENT_STOP|mei	<eps>

# 0500-0599 裏コマンド
1	500	RECOG_EVENT_STOP|初音ミク	MODEL_CHANGE|mei|Model\miku\miku.pmd
1	500	RECOG_EVENT_STOP|ミク,いい	MODEL_CHANGE|mei|Model\miku\miku.pmd
1	500	KEY|N	MODEL_CHANGE|mei|Model\miku\miku.pmd
500	501	<eps>	SYNTH_START|mei|mei_voice_normal|初音ミクと申します。よろしくお願いします。
501	2	SYNTH_EVENT_STOP|mei	<eps>
