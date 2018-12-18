//
//  HZSort.c
//  SevenSort
//
//  Created by KB on 2018/6/27.
//  Copyright © 2018年 HZ. All rights reserved.
//

#include "HZSort.h"


/*
  冒泡排序 ：
  2，4，6，5，8，7，3，1，9，0
 */

void bubbleSort(int array[],int n){
    int i , j , temp ;
    for (i = 0; i < n; i++) {
        for(j=n-1;j-i>0;j--){
            if (array[j]<array[j-1]) {
                temp = array[j];
                array[j] = array[j-1];
                array[j-1] = temp;
            }
        }
    }
}

void bubbleSortOptimize(int array[],int n){
    int i , j , temp ;
    int  flag = 1; // 设置flag优化，避免已排好序列再次多余的遍历
    for (i = 0; i < n&&(flag==1); i++) {
        // 每次从数组的尾部开始遍历，到顶部未排序的元素位置为止
        flag = 0;
        for(j=n-1;j-i>0;j--){
            if (array[j]<array[j-1]) {
                temp = array[j];
                array[j] = array[j-1];
                array[j-1] = temp;
                flag = 1;
            }
        }
    }
}

/*
   选择排序
     2，4，6，5，8，7，3，1，9，0
    每次遍历找出最小值的位置，然后与当前位置做交换
 */

void selectSort(int array[],int n){
    int i ,j , minIndex ,temp;
    for (i=0; i<n; i++) {
        minIndex = i;
        for (j=i; j<n; j++) {
            if (array[minIndex]>array[j+1]) {
                minIndex = j+1;
            }
        }
        if (minIndex!=i) {
            temp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = temp;
        }
    }
}

void select1(int array[],int n){
    int i,j,temp,minIndex;
    for (i=0; i<n; i++) {
        minIndex = i;
        for (j=i+1; j<n; j++) {
            if (array[j]<array[minIndex]) {
                minIndex = j;
            }
        }
        // 交换最小元素
        if (i!= minIndex) {
            temp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = temp;
        }
    }
}


/*
   插入排序
   2，4，6，5，8，7，3，1，9，0
 
   2，4，5，6，7，8，3，1，9，0
 */

void insertSort(int array[],int n){
    int i ,j,temp ;
    for (i=1; i<n; i++) {
        temp = array[i];
        for (j=i; j>0&&array[j-1]>temp; j--) {
            array[j] = array[j-1];
        }
        array[j] = temp;
    }
}

void insertSortV(int array[],int n){
    int i,j,temp;
    for (i=1; i<n; i++) {
        for (j = i; j>0; j--) {
            if (array[j]<array[j-1]) {
                temp = array[j];
                array[j] = array[j-1];
                array[j-1]= temp;
            }
        }
    }
}

// 7,1,6,3,2,9,4,8,5,0
/*
 1: 分 5 组
 分组： {7，9}{1，4}{6，8}{3，5}{2，0}
 检查：每组执行插入操作
 排序后： 7,1,6,3,0,9,4,8,5,2
 2:分 2 组
 {7,6,0,4,5}{1,3,9,8,2}
 检查：每组执行插入操作
 排序后： 0，4，5，6，7，1，2，3，8，9
 3：分 1 组
 { 0，4，5，6，7，1，2，3，8，9}
 检查：执行插入操作
 排序后： 0，1，2，3，4，5，6，7，8，9
 */

void shellsort1(int a[], int n){
    int i, j, gap;
    for (gap = n / 2; gap > 0; gap /= 2){// 进行分组
        for (i = 0; i < gap; i++){ // 对每一组执行插入操作
            for (j = i + gap; j < n; j += gap)
                if (a[j] < a[j - gap]){
                    int temp = a[j];  // j = 4 temp  =0
                    int k = j - gap;//子序列前一个元素的下标 k=2 gap=2
                    while (k >= 0 && a[k] > temp)
                    {
                        a[k + gap] = a[k];
                        k -= gap;
                    }
                    a[k + gap] = temp;
                }
        }
    }
}


void shellsort2(int a[], int n){
    int j, gap;
    for (gap = n / 2; gap > 0; gap /= 2){
        for (j = gap; j < n; j++)
            if (a[j] < a[j - gap]){
                int temp = a[j];
                int k = j - gap;
                while (k >= 0 && a[k] > temp){
                    a[k + gap] = a[k];
                    k -= gap;
                }
                a[k + gap] = temp;
            }
    }
}

// 快速排序

void quickSort1(int array[],int left,int right){
    if (left<right) {
        int i = left;
        int j = right;
        int x = array[i];
        
        while (i<j) {
            //  从右像左查找小于x的元素填充array[i];
            while (i<j && array[j]>=x) {
                j--;
            }
            if(i<j){
                array[i] = array[j];
                i++;
            }
            
            // 从左向右找大于或等于x的数来填充array[j];
            while (i<j&&array[i]<x) {
                i++;
            }
            if (i<j) {
                array[j] = array[i];
                j--;
            }
        }
        // 退出时 i=j
        array[i] = x;
        quickSort1(array, left, i-1);
        quickSort1(array, i+1, right);
    }
}



// ****************** 归并排序 ******************

/*
 
   7,1,6,3,2,4,8,5
 分：
 第一次拆分： {7,1,6,3} {2,4,8,5,}
 第二次拆分： {7,1}{6,3} {2,4}{8,5}
 第三次拆分： {7}{1}{6}{3} {2}{4}{8}{5}
 
 和： 相邻的两个有序数组合并
 （1）{1，7}{3，6}  {2，4}{5，8}
 （2）{1，3，6，7} {2，4，5，8}
 （3）{1，2，3，4，5，6，7，8}
 
 
 */

void merge(int array[],int left,int mid,int right,int temp[]);

// 归并排序实现
void mergeSort(int array[],int left,int right,int temp[]){
    if (left < right) {
        int mid = (left + right)/2;
        mergeSort(array, left, mid, temp);//左侧归并排序，使得左子树有序
        mergeSort(array, mid+1, right, temp);//右侧归并排序，使得y右子树有序
        merge(array, left, mid, right, temp);// 将两个有序数组合并
    }
}


// 将两个有序数组借助临时数组进行合并为一个有序数组
void merge(int array[],int left,int mid,int right,int temp[]){
    int i = left; //左指针
    int j = mid + 1;// 右指针
    int x = 0; // 临时数组指针
    while (i<=mid && j<=right) {
        if (array[i]<=array[j]) {
            temp[x++] = array[i++];
        }else{
            temp[x++] = array[j++];
        }
    }
    while (i <= mid) {
        temp[x++] = array[i++];
    }
    while (j <= right) {
        temp[x++] = array[j++];
    }
    x = 0 ;
    while (left <= right) {
        array[left++] = temp[x++];
    }
}


// ****************** 归并排序 ******************



// ****************** 堆排序 ******************

/*
   堆排序是利用堆这种数据结构而设计的一种排序算法，堆排序是一种选择排序，平均时间复杂度为O(nlogn)
   堆是一种完全二叉树，它满足父结点元素都大于等于子结点(大顶堆)或者父结点元素都小于等于子结点（小顶堆）
   堆排序的思想是将无序数列先调整为大顶堆，即数列中最大的值处在树的根结点上，将根结点与数列最后一个元素互换；
   然后再对n-1个元素进行调整为大顶堆，最大值与当前数列最后一个元素互换，依次执行此操作即可得到有序数列；
 
  */

void adjustHeap(int i,int array[],int length);
void swap(int array[],int a,int b);

void heapSort(int array[],int length){
    // 构建大顶堆
    for (int i = length/2-1; i>=0; i--){
        adjustHeap(i, array, length);
    }
    // 调整堆结构+交换堆顶元素与末尾元素进行交换
    for (int j = length -1; j>0; j--) {
        swap(array, 0, j);
        adjustHeap(0, array, j);
    }
}


/**
 *
 * 调整最大堆：在非叶子结点和左右子结点中选出最大值，将最大值与非叶子结点互换；
 */
void adjustHeap(int i,int array[],int length){
    int temp = array[i];
    for (int j = i*2 + 1; j < length; j = j*2+1) {
        if (j+1 < length && array[j] < array[j+1] ) {
            j++; // 树的左结点小于右结点
        }
        if (array[j] > temp) {
            array[i] = array[j];
            i = j;
        }else{
            break;
        }
    }
    array[i] = temp;
}

// 交换数组中的两个元素
void swap(int array[],int a,int b){
    int temp = array[a];
    array[a] = array[b];
    array[b] = temp;
}

// ****************** 堆排序 ******************
