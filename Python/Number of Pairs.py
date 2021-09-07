# nums = [2, 3, 3, 2, 4, 5, 4, 4, 6, 2, 3, 6, 4]

# def find_count(nums):
#     num_dict = {}
#     for num in nums:
#         if num in num_dict:
#             num_dict[num] += 1

#         else:
#             num_dict[num] = 1
#     count = 0

#     for key in num_dict:
#         count += num_dict[key] // 2

#     return count

# print(find_count(nums))

nums = [9,6,4,2,3,5,7,0,1]
num_len = len(nums)

def count_value(nums):

    for i in range(num_len):
        if i in nums:
            continue
        else:
            return i

print(count_value(nums))

