# This file was generated, do not modify it. # hide
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