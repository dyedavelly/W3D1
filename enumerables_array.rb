class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr=[]  
        self.my_each do |ele|
            if prc.call(ele)
                arr<<ele
            end
        end
        arr
    end

    def my_reject(&prc)
        arr=[]
        self.my_each do |ele|
            if !prc.call(ele)
                arr<<ele
            end
        end
        arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
           return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
         end
         true
    end

    def my_flatten
        if !self.is_a?(Array) 
             [self]
        end
        arr = []
        self.each do |val|
            if val.is_a?(Array)
                arr += val.my_flatten
            else
                arr << val
            end
        end     
        arr
    end

    def my_zip(*args)
        col = args.length+1
        row = self.length
        res = Array.new(row) {Array.new(col)}
        (0...row).each do |i|
            (0...col).each do |j|
                res[i]<<self[j]
                res[i]<<args[i][j]
            end
        end
        res
    end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)



   