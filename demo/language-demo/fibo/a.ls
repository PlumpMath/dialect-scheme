
fibo = ->
  if it < 2 then 1 else (fibo (it - 1)) + (fibo (it - 2))

console.log fibo 40