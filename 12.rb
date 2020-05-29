p "*** Notación %  ***"
puts %q('Hola' mundo)   #=> 'Hola' mundo      string literal
puts %i(/,-,*)          #=> [:"/,-,*"]        array de simbolos
patron= %r(\d)          #=> /\d\              expresiones regulares
p patron::match(2)      #=> #<MatchData "2">

# https://ruby-doc.org/core-2.0.0/doc/syntax/literals_rdoc.html#label-Percent+Strings