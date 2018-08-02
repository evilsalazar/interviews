
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  hs = Hash.new(0)
  nums.each {|n| hs[n] += 1}
  res = hs.keys.sort_by! {|e| -hs[e]}
  res[0,k]
end
