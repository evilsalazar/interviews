# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    nums.sort!
    hash = {}
    result = []
    nums.each do |num|
        hash[num] = (hash[num] ||= 0) + 1
    end

    # Count if there is only
    
    hash.select do |k, v|
      v.positive?
    end.count

    hash.each_with_index do |(k,v), index|
        if k.negative?
            # Negative Negative Positive
            i = index + 1
            while i < hash.keys.length && hash.keys[i] < 0
              negative_sum = (k + hash.keys[i]) *-1
              if hash.has_key?(negative_sum)
                result.push([k, hash.keys[i], negative_sum])
              end
              i += 1
            end
            # Negative Positive Positive
            i = hash.keys.length - 1
            while (i >= 0) && (hash.keys[i] > 0)
              if hash.keys[i] < k *-1
                positive_sum = (k + hash.keys[i]) *-1

                if hash.has_key?(positive_sum) && (hash.keys[i] > positive_sum)
                  if positive_sum == hash.keys[i] && hash[hash.keys[i]] > 1
                    result.push([k, positive_sum, hash.keys[i]])
                  elsif
                    result.push([k, positive_sum, hash.keys[i]])
                  end
                end
              end
              i -= 1
            end

            if  v > 1 && hash.has_key?(k *-2)
                result.push([k, k, k*-2])
            end
            positive = k *-1
            if hash.has_key?(0) && hash.has_key?(positive)
                result.push([k, 0, positive])
            end

            first = positive / 2
            second = positive - first
            if first == second && hash.has_key?(first) && hash[second] > 1
                result.push([k, first, second]) unless result.last == [k, first, second]
            end
        elsif k.zero?
            if v > 2
                result.push([0, 0, 0])
            end
        end
    end
    result
end


input = [82597,-9243,62390,83030,-97960,-26521,-61011,83390,-38677,12333,75987,46091,83794,19355,-71037,-6242,-28801,324,1202,-90885,-2989,-95597,-34333,35528,5680,89093,-90606]
output = three_sum(input)
puts output.to_s
