au BufEnter *.test let b:fswitchdst = 'result' | let b:fswitchlocs = '../r'
au BufEnter *.result let b:fswitchdst = 'test' | let b:fswitchlocs = '../t'
