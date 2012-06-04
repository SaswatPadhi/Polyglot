#<?php eval('echo "PHP Code\n";'); __halt_compiler(); ?>

print ((("b" + "0" == 0) and eval('"Perl Code\n"')) or (0 and "Ruby Code\n" or "Python Code"));

__DATA__ = 1
"""""
__END__

===== This is comment of all. =====

outputs:

  $ perl polyglot.pl.php.py.rb
  Perl Code
  $ php polyglot.pl.php.py.rb
  #PHP Code
  $ python polyglot.pl.php.py.rb
  Python Code
  $ ruby polyglot.pl.php.py.rb
  Ruby Code
  $

"""