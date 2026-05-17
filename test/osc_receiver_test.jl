using Test
using tcxOsc; osc = tcxOsc

@testset "Osc Receiver Test" begin

    r = OscReceiver()

    @test isListening(r) == false
    @test hasNewMessage(r) == false

end