For Developers
============
You can also see [Java](https://github.com/starlangsoftware/Sampling), [Python](https://github.com/starlangsoftware/Sampling-Py), [Cython](https://github.com/starlangsoftware/Sampling-Cy), [C++](https://github.com/starlangsoftware/Sampling-CPP), or [C#](https://github.com/starlangsoftware/Sampling-CS) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called Sampling-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/Sampling-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run Sampling-Swift.

Detailed Description
============

+ [CrossValidation](#crossvalidation)
+ [Bootstrap](#bootstrap)
+ [KFoldCrossValidation](#kfoldcrossvalidation)
+ [StratifiedKFoldCrossValidation](#stratifiedkfoldcrossvalidation)

## CrossValidation

k. eğitim kümesini elde etmek için

	func getTrainFold(k: Int) -> [T]

k. test kümesini elde etmek için

	func getTestFold(k: Int) -> [T]

## Bootstrap

Bootstrap için BootStrap sınıfı

	init(instanceList: [T], seed: Int)

Örneğin elimizdeki veriler a adlı dizide olsun. Bu veriler üstünden bir bootstrap 
örneklemi tanımlamak için (5 burada rasgelelik getiren seed'i göstermektedir. 5 
değiştirilerek farklı samplelar elde edilebilir)

	bootstrap = = Bootstrap(instanceList: a, seed: 5)

ardından üretilen sample'ı çekmek için ise

	sample = bootstrap.getSample();

yazılır.

## KFoldCrossValidation

K kat çapraz geçerleme için KFoldCrossValidation sınıfı

	init(instanceList: [T], K: Int, seed: Int)

Örneğin elimizdeki veriler a adlı dizide olsun. Bu veriler üstünden 10 kat çapraz 
geçerleme yapmak için (2 burada rasgelelik getiren seed'i göstermektedir. 2 
değiştirilerek farklı samplelar elde edilebilir)

	kfold = KFoldCrossValidation(instanceList: a, K: 10, seed: 2)

ardından yukarıda belirtilen getTrainFold ve getTestFold metodları ile sırasıyla i. eğitim
ve test kümeleri elde edilebilir. 

## StratifiedKFoldCrossValidation

Stratified K kat çapraz geçerleme için StratifiedKFoldCrossValidation sınıfı

	init(instanceLists: [[T]], K: Int, seed: Int)

Örneğin elimizdeki veriler a adlı dizide olsun. Stratified bir çapraz 
geçerlemede sınıflara ait veriler o sınıfın oranında temsil edildikleri için her bir 
sınıfa ait verilerin ayrı ayrı dizilerde olmaları gerekmektedir. Bu veriler üstünden 
30 kat çapraz geçerleme yapmak için (4 burada rasgelelik getiren seed'i göstermektedir. 4 
değiştirilerek farklı samplelar elde edilebilir)

	stratified = StratifiedKFoldCrossValidation<String>(instanceLists: a, K: 30, seed: 4)

ardından yukarıda belirtilen getTrainFold ve getTestFold metodları ile sırasıyla i. eğitim
ve test kümeleri elde edilebilir. 
