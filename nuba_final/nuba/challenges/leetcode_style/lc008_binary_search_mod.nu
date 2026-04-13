# LeetCode Style: Search in Rotated Array

fun search_rotated(nums,target){
    let lo=0; let hi=len(nums)-1
    while lo<=hi {
        let mid=floor((lo+hi)/2)
        if nums[mid]==target { return mid }
        if nums[lo]<=nums[mid] {
            if nums[lo]<=target and target<nums[mid] { hi=mid-1 }
            else { lo=mid+1 }
        } else {
            if nums[mid]<target and target<=nums[hi] { lo=mid+1 }
            else { hi=mid-1 }
        }
    }
    return -1
}
print(search_rotated([4,5,6,7,0,1,2],0))
print(search_rotated([4,5,6,7,0,1,2],3))
