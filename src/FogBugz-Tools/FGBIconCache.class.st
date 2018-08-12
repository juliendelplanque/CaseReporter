"
An icon cache
"
Class {
	#name : #FGBIconCache,
	#superclass : #Object,
	#classVars : [
		'Icons'
	],
	#category : #'FogBugz-Tools-Utilities'
}

{ #category : #icons }
FGBIconCache class >> fogBugzIcon [
	^ self icons
			at: #'fogBugzIcon'
			ifAbsentPut: [ self fogBugzIconContents base64Decoded readStreamDo: [ :s | Form fromBinaryStream: s ] ].
]

{ #category : #'private - icons' }
FGBIconCache class >> fogBugzIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACjUlEQVR42mNkIAKI8wqpA6kw
IO55+fndd2Q5RkKaJXiFwlRkeOqlRDnUHj7/dunhi28NLz6/20yUAdICwknxXvJzdZT44GJr
9z/9d+zyW+fnn94dwGuAJK+QnpOJ2DFvawluEP/W4y8MogLsDK/f/2RYuefJ6uvPXoRhGAD0
qyQzI4OXohS3s4YCX6CDsQgHMyNEye5TrxhUNTQYXr16w3Di7L1DJ24/sUcxQJJPKMZQTXCG
h4UYl4gAO1aXvfv0i+Hf6ycME3d/67n75k0p3ACgc40cjERPaCnysSrJcAEFEfpfAZ0szM/G
wMzEyPDg+df/P25d+aUs8OdN3WEeu4cf3t8DqzRVllnqZi4WpaXEi6IZBH79+cdw89EXhjPX
3l+5dv9Tz59//9fZSP+s0xD+o9F69KcvWHWYndodD0txZQ5WZpwx0jTvRsONZy8aoWHF5Cz/
feejj0wpjECOoI+1xGNnEzFuXJp//P7LUD39ahYw6qbDxJQEBfWZmRg4Ge205db72UoFSIlw
4LT96evvDBNW3MkFOn8qNNx4gSnyIzgQPU2U7sV4yCqi+/3xy28M3Ey/GRjYORn4eVgZNh56
fubN42dzv/5mtNcU/iO66PJ3F7ABwKQqLSvGVW+pJxQFdAW3nDgXw/5DNxlkuP4wvPvHwcDK
L8ygLs/DcO/CjafSzB+fyfL+MZ59kXP96RccJUBXPIBbCwwLLmCan+Uk9zNalvU9gyz3H4aN
t9nfH3jKPYOLm/2TDvcH8Trrr/nnXzF/mn2Bs+3ia7Y+oAF/0FMio7Hk3+Bsg09ztUX+86Xu
4Oncfe9LBUxeGRjeX34zngZqfIk3M3mp8AYKc/4z3vWAvRao+D8DHgAAEYf2Ff/ZkDcAAAAA
SUVORK5CYII='

]

{ #category : #icons }
FGBIconCache class >> fogBugzLoginIcon [
	^ self icons
			at: #'fogBugzLoginIcon'
			ifAbsentPut: [ self fogBugzLoginIconContents base64Decoded readStreamDo: [ :s | Form fromBinaryStream: s ] ].
]

{ #category : #'private - icons' }
FGBIconCache class >> fogBugzLoginIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAfNJREFUeNpi/P//PwMlgJFiA0L3PkYXiwbiOCA2AOJ/QHwJ
iOcD8QqYglVOMnDFLP/+wtlmQJwiI8IVqyLGwyrOw8oMdNv/V19+O9999cXu8ZtvlkD5uVAD
kQ1ghLFTdBQEEqT42ZivPvr4Y/+Hn2CjZQTZWYwU+Nll+Ngzj97+ABLKR/GC3+YnYM1SIlyT
lSS52Y5dffP137//RVBng0AiECcD8SmYC/j5GBIW2UkvABvgvQ5swHE9LSGzJ0+//Hj38RfI
hjn4Ag5oACjkU5Y6S89l+feHkY2JkVGbgYmZ6d2733///WdchK6Bh4sBJap+/wBTc8K2PmNm
+fub4e8/xv8MX3//+//7F8NXoMQvdAN+f2fE5RgVpr+/Gf/++cV49eevv//ZOFj5gPxMIGZA
xp+/MjAi418/GBmAuG99iGQZs7xPMcP/fwyMwMhw55XkYP/08pc9MGo/AMXuAjEnEKcD8Rwg
lgXi+0D8nuEPk+COBIkicCDazXgGc06fmDZ3DhM7E/P7e99//v7yFxyNbDzMzIIqnOy/v/79
8+b6t16gUNXBdElEOvj7B+6/uc8vfmPglWXP5FPiZGXhYuIACf75/u/vh8e/fn55+msC0D6M
2EFOiVeBuOjjg5/HgTgGmpRB4AI0TWygTWai1ACAAAMAFJDf0nu5SvUAAAAASUVORK5CYII='

]

{ #category : #icons }
FGBIconCache class >> fogBugzLogoutIcon [
	^ self icons
			at: #'fogBugzLogoutIcon'
			ifAbsentPut: [ self fogBugzLogoutIconContents base64Decoded readStreamDo: [ :s | Form fromBinaryStream: s ] ].
]

{ #category : #'private - icons' }
FGBIconCache class >> fogBugzLogoutIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAhJJREFUeNqkUz1oFEEUnpndudm9y14CJxdDVsVC7SSVnVwZ
y1SWNl5hfShoISqRKyxsbQ6sTSMWBoQUwUYQLa2UgDkv3sEZyOb2f2bW9469c11jlYGP933z
3r558/YNzbKMnGbRm7v9//meA9qAHqBTdLxquXPOMk3ISVApad+46jpoy77iYloRUsA6oIZc
xpRMYj21uc8GtJCXEmDAFPeajv3aIGwIvJZGlIwDRdCCtmnGRo2atQ2883cCCdklaQnDeHTJ
rVsyhSol0UlIyJFUBG0eQ66cq1ucsicbbwdr8wQKHIDbbtMRewM/SZJsE3SIJ4dVNq0ANe73
R2G62lwQoNuFCqiRKbrBbdP8MYxS0C8BePfelzeHx2hRA7b6w0hWbG4CX58lMKHLdc4ZjaCS
MMBCyRgdCw3dmf0+iMH105cKekgp6OU/CSTxtNKZ1JoYBuNJrC/A/vcT5mKlIhiDGjP4Zly8
glIp3T4OlLTqgoO+lZdcRru6JLg3kRL4TrmJvYNvQeycFdy0zPugu4C13Ie2C/ud2rLgGIfx
81G+/uJgxh86q+LB4kXL8vbjNBinUgZKmVXDqJ7h5uJ5wQ+/hpE/Sp6+v7PSnfcAhyhfm0f7
iRH8kneXLtuVhissw6JMxZlOPaUGHye+DPUzOLNbbIxZGs3HsaffjT75+J+vAbChe4AP+aP6
/M9rPO1z/i3AANDmUfM48z/dAAAAAElFTkSuQmCC'

]

{ #category : #icons }
FGBIconCache class >> fogBugzSearchIcon [
	^ self icons
			at: #'fogBugzSearchIcon'
			ifAbsentPut: [ self fogBugzSearchIconContents base64Decoded readStreamDo: [ :s | Form fromBinaryStream: s ] ].
]

{ #category : #'private - icons' }
FGBIconCache class >> fogBugzSearchIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAhtJREFUeNqMks9rE0EUx2d/p8Fums1KcWkgNlDaSFIP/gk5
VXoRsRSLpVgKHjxU8SI9WXtNwUshFMyhUC8FTwoiBW9C14IhpammgZKqqTGaZDcbszs761tB
aNON7Re+zOF958ObeY9yHAe5Sq+vy3DMgm+Ah8E74Bfg1bnJySbqIsoFrKyt3aZpeiURi/GR
cJgLiCJdq9dJ8eDAyuXzJmRm7k1NbXgCnmUy/XD58/Vk0i9LEtMZOKpU7NebmwZABu5PTzc6
6zTG+G58ZEQI9vUxNiGo03IoxMSGhnjIzXp1QFsY37kciXAYwt0cHRzkIDfjBWBt21Z4QaDc
YDdB3e30kmcHpmV91XTd8Wr/n6FOoINvngAgZ9yf/t8Tcru7cB8/93wCFFa3VPWxoijsRVk+
NYVyuWyr29tmKT6mTrw77L8VV45O7cGjpaW/e3B1dJSPRqNcSJLoCoxvv1jEH7NZk9G0Xv3m
w5aFHaeqt+fr+1z6BMDVg8VF8dgmJsAfwBulxERODARfhaVe37DCU2/zVaOqmfPNEps+Aeim
8ZdfBnwM88msMT2xKxdQIsyjN9mfxg+AtL+zaRqdIQgdak2ygPykldvR0VbxN0rGJX9AEJZp
0Z47E+CKNJgUTHIBs6SV3zPQ+0ILjV0L+n0cl2LROcW06ZTRJojzoaeFQqvHYBy79guTcwNc
CQggDQdhn/NkT20S5FDjfwQYAChaRsx7+Z3rAAAAAElFTkSuQmCC'

]

{ #category : #accessing }
FGBIconCache class >> iconNamed: aSymbol [
	(self class canUnderstand: aSymbol) ifFalse: [ ^super iconNamed: aSymbol ].
	^self icons at: aSymbol ifAbsentPut: [self perform: aSymbol]
]

{ #category : #accessing }
FGBIconCache class >> icons [
	^ Icons ifNil: [Icons := Dictionary new]
]

{ #category : #initialization }
FGBIconCache class >> reset [
	<script>
	
	Icons := nil
]
