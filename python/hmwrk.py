# Ввод значений 
nums = list(map(int,input().split()))
target = int(input())


def find_indx(nums,target):

    part_sum_dict = {}
    cur_part_sum = 0
    
    for i in range(len(nums)):
        cur_part_sum += nums[i]
        part_sum_dict[cur_part_sum] = i
        
        if (cur_part_sum - target) in part_sum_dict:
            return (part_sum_dict[cur_part_sum-target]+1,i)
            
            
    return (None,None)  # если нет таких индексов, то возвращаем (None,None)
 
print(find_indx(nums,target))