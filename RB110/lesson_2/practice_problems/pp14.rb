hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

a =  hsh.map do |_, value|
  case  value[:type]
  when 'fruit'
    value[:colors].map {|color| color.capitalize}
  when 'vegetable'
    value[:size].upcase
  end
end

p a