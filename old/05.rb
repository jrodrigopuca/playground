# Enumerables
p [1, 2, 3].map{ |v| v*10}	#=> [10, 20, 30]
p [3, 5, 1].sort				#=> [1, 3, 5]
p [3, 5, 1, 2, 4].select {|n| n.even?}	#=> [2, 4]
p "---"
[1,2,3,4].each_cons(3){|a| p a}
#=> [1, 2, 3]
#=> [2, 3, 4]
p "---"
p ["a", "b", "c"].any? { |word| word=="a"}	#=> true

p (1..10).detect { |i| i>5?i:0 } 


#hash
menu={"Section 1":"#section1", "Section 2":"#section2"}
menu.each do |key, value|
	p value
end

#r3-10