json.array! @diets do |diet|
  json.partial! 'diets.json.jbuilder', diet: diet
end
