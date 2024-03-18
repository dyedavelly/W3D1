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
        col = args.length + 1
        row = self.length
        res = Array.new(row) {Array.new()}
        (0...row).each do |i|
            res[i] << self[i]
            args.each do |arg|
                res[i] << arg[i]
            end
        end
        res
    end

    def my_rotate(n=1)
        new_arr = self.dup
        if n > 0
            n.times do |i|
                first = new_arr.shift
                new_arr << first
            end
        else 
            n = n.abs
            n.times do |i|
                first = new_arr.pop
                new_arr.unshift(first)
            end
        end
        new_arr 
    end
end





   