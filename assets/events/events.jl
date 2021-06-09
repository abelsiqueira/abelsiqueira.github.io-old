# This file was generated, do not modify it. # hide
# hideall
using YAML
data = YAML.load_file("_data/events.yml")
for talk in data
  event, link, title = talk["event"], get(talk, "link", nothing), get(talk, "title", nothing)
  kind, date, venue = get(talk, "kind", nothing), get(talk, "date", nothing), get(talk, "venue", nothing)
  if link !== nothing
    println("[$event]($link)")
  else
    println(event)
  end
  println("~~~<br>~~~")
  if title !== nothing
    println("_$(title)_")
  end
  if kind !== nothing
    println("**$kind**, ")
  end
  println("$date, $venue")
  println("~~~<br><br>~~~")
end