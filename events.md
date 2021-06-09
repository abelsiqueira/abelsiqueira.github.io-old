@def title = "Events"

```julia:./events.jl
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
```

~~~<div class="row"> <div class="col-xs-12">~~~
\textoutput{./events.jl}
~~~</div> </div>~~~