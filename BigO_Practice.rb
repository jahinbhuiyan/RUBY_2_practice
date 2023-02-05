# ## inefficient way to write this code 

# list = [0,3,5,4,-5,10,1,90]

# def my_min(list)  # O(n^2)
#     min = -1000
#     (0...list.length).each_with_index do|ele1,idx1|   # O(n)
#         (idx1 + 1 ... list.length).each_with_index do|ele2, idx2|  #O(n)
#             if list[idx1] < list[idx2] 
#                 min = list[idx1]
#             end
#         end
#     end
#     return min
# end

# p my_min(list)  # O(n)

# ## efficient way to write this code

# def my_min_2(list)
#     min = list.min
# end

# p my_min_2(list)



list = [5, 3, -7]
    
def largest_contiguous_subsum(list)
    result = []
    (0...list.length).each do |idx1|
        (idx1...list.length).each do |idx2|
            result << list[idx1..idx2]
        end
    end
    result.map {|subarr| subarr.inject(:+)}.max
end

print largest_contiguous_subsum(list)
puts

def largest_contiguous_subsum2(array)
    current = array.first
    largest = array.first

    (1...array.length).each do |idx|
        current = 0 if current < 0
        current += array[idx]
        largest = current if current > largest
    end
    largest
end

p largest_contiguous_subsum2(list)



def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)

    str1.each_char do |char|
        count1[char] += 1
    end

    str2.each_char do |char|
        count2[char] += 1
    end

    count1 == count2
end

print fourth_anagram?("gizmo", "lives")
puts

def fourth_anagram_2?(str1, str2)
    count = Hash.new(0)

    str1.each_char { |char| count[char] += 1}
    str2.each_char {|char| count[char] -= 1}

    count.each_value.all? {|sum| sum == 0}
end

print fourth_anagram_2?("elvis", "lives")
puts

arr = [0, 1, 5, 7]
def two_sum?(arr, target)
    
    (0...arr.length).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target
        end
    end
    return false
end

print two_sum?(arr, 6)
puts # => should be true
print two_sum?(arr, 10) # => should be false

def two_sum?(arr, target) #O(n)
    hash = {}
    #inserting all elements into hash
    arr.each do |ele|
        hash[ele] = true       #{2:true, 3:true, 5:true, 7:true}, target = 12
    end
    #this time we are checking if compliments exist
    #checking if target - element exists
    arr.each do |ele|
        if hash[target - ele] == true      # for 2: no if; for 3 no if; for 5 we enter the if statement and return true bcs 12-5 = 7  and 7 exists as a key
            return true
        end
    end
    false
end
# arr = [2,3,5,7] t = 12
def two_sum_indices?(arr, target)
    hash = {}
    #inserting all elements into hash with index
    arr.each_with_index do |ele, idx|
        hash[ele] = idx
        #{2=0,3=1,5=2,7=3}
    end
    #checking if target - element exists
    arr.each_with_index do |ele, idx|
        if hash.has_key?(target-ele)
            #
            original_idx = hash[target - ele] # hash[12-5] = hash[7] = 3 :- original_idx = 3

            return [idx,original_idx]  #idx = 2
        end
    end
    return nil
end

def two_sum?(arr, target)
    hash = {}
    arr.each do |ele|
        hash[ele] = true
    end

    arr.each do |ele|
        if hash[target - ele] == true
            return true
        end
    end
    false
end

def two_sum_indices?(arr, target)
    hash = {}
    
    arr.each_with_index do |ele,idx|
        hash[ele] = idx
    end

    arr.each_with_index do |ele, idx|
        if hash.has_key?(target - ele)
            original_idx = hash[target - ele]
            return [idx,original_idx]
        end
    end
    return nil
end







def two_sum?(arr, target)
    hash = {}
    arr.each do |ele|
        hash[ele] = true
    end

    arr.each do |ele|
        if hash[target - ele] == true
            return true
        end
    end
    false
end


def two_sum_indices?(arr, target)
    hash = {}
    
    arr.each_with_index do |ele, idx|
        hash[ele] = idx
    end

    arr.each_with_index do |ele, idx|
        if hash.has_key?(target - ele)
            original_idx = hash[target - ele]
            return [idx, original_idx]
        end
    end
    nil
end


def two_sum?(arr, target)
    hash = {}
    
    arr.each do |ele|
        hash[ele] = true
    end

    arr.each do |ele|
        if hash[target - ele] == true
            return true
        end
    end
    return false
end


def two_sum_indices?(arr, target)
    hash ={}

    arr.each_with_index do |ele, idx|
        hash[ele] = idx
    end

    arr.each_with_index do |ele, idx|
        if hash.has_key?(target - ele)
            idx2 = hash[target - ele]
            return [idx, idx2]
        end
    end
    return nil
end