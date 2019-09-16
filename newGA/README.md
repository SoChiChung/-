# 使用方法

+ **tao**暂时还没赋值，先使用**mydata**文件夹里面**data.mat**的值

+ 运行主程序是**main.m**  里面的**var0** 就是具体的var0参数设置可以一次设置很多的var0

+ **mode.m** 函数是遗传算法针对单个var0 求解函数  **Gmax**是求解的代数**propsize**是一代的最大容量

+ 运行程序 命令行输入

  ```matlab
  [bestins,E_max] = main()
  ```

  

**bestins**是每一个**var0**下的最优投资比例 **E_max**是对应的期望值

+ 如果需要求其他的（如风险） 利用bestins中的投资比例求解便可