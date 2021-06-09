<!-- ## Em andamento / Ongoing -->

```julia:./orientacoes-em-andamento.jl
# hideall
using YAML
data = YAML.load_file("_data/supervision.yml")
println("~~~")
for aluno in data
  haskey(aluno, "end") && continue
  print("""
  <p class="student">
  <strong>$(aluno["name"])</strong> <br>
  &nbsp; <em style="font-variant: small-caps"> $(aluno["theme"])</em> <br>
  &nbsp; $(aluno["type"]) <br>
  &nbsp; $(aluno["start"]) -- <br>
  """)
  if haskey(aluno, "coadvisor")
    println("""
    &nbsp; <br>Co-orientado por <strong>$(aluno["coadvisor"])</strong>.
    """)
  end
  println("""
  </p>
  """)
end
println("~~~")
```

~~~<div class="row students"> <div class="col-xs-12">~~~
\textoutput{./orientacoes-em-andamento.jl}
~~~</div> </div>~~~

## Concluídas / Finished

```julia:./orientacoes-concluidas.jl
# hideall
using YAML
data = YAML.load_file("_data/supervision.yml")
println("~~~")
for aluno in data
  haskey(aluno, "end") || continue
  print("""
  <p class="student">
  <strong>$(aluno["name"])</strong> <br>
  &nbsp; <em style="font-variant: small-caps"> $(aluno["theme"])</em> <br>
  &nbsp; $(aluno["type"]) <br>
  &nbsp; $(aluno["start"]) -- $(aluno["end"]) <br>
  """)
  if haskey(aluno, "link")
    println("""
    &nbsp; <a href="/assets/$(aluno["link"])">Download</a><br>
    """)
  end
  if haskey(aluno, "coadvisor")
    println("""
    &nbsp; Co-orientado por <strong>$(aluno["coadvisor"])</strong>.
    """)
  end
  println("""
  </p>
  """)
end
println("~~~")
```

~~~<div class="row students"> <div class="col-xs-12">~~~
\textoutput{./orientacoes-concluidas.jl}
~~~</div> </div>~~~