local fibo
fibo = function(it)
  if it < 2 then
    return 1
  else
    return (fibo((it - 1))) + (fibo((it - 2)))
  end
end
return print(fibo(40))
