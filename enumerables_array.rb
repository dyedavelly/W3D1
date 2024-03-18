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
        
    end
end


   