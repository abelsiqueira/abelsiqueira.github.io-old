using Base.Test

include("seulu.jl")

function teste_seulu()
  @testset "Teste manual" begin
    A = [2.0 3.0; 1.0 5.5]
    L, U, P = seulu(A, pivot=false)
    @test L == [1.0 0.0; 0.5 1.0]
    @test U == [2.0 3.0; 0.0 4.0]
    @test P == [1; 2]
    @test L * U == A
  end

  @testset "Teste aleatório com error nϵ(‖A‖+‖L‖‖U‖)" begin
    for t = 1:10
      for n = 5:5:10
        A = rand(n,n)
        L, U, P = seulu(A, pivot=false)
        @test norm(L * U - A) < n * eps(Float64) * (norm(A) + norm(L) * norm(U))
      end
    end
  end

  nothing
end

teste_seulu()
