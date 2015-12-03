component extends="testbox.system.BaseSpec" {


    function run(){
        describe("Callback Mocking", function(){

            it("Should just echo what we pass in", function(){
                    var ObjToMock = new ModelBean();

                    var res = ObjToMock.mainfunk("Hello", "World");
                    expect(res).ToBeTypeOf("struct");
                    expect(res.arg1).toBe("Hello");
                    expect(res.arg2).toBe("World");
            });

            it("Should count the callback to callbacker", function(){
                    var ObjToMock = getMockBox().prepareMock(new ModelBean());

                    ObjToMock.$reset();
                    ObjToMock.$("callbacker", {arg1:"Hello", arg2:"World"} );


                    var res = ObjToMock.mainfunk("Hello", "World");
                    expect(ObjToMock.$count("callbacker")).ToBe(1);

            });

            it("Should override what callback returns", function(){
                    var ObjToMock = getMockBox().prepareMock(new ModelBean());
                    ObjToMock.$(method:"callbacker", callback:function(){
                            return "Overriden";
                    });


                    var res = ObjToMock.mainfunk("Hello", "World");
                    expect(res).ToBe("Overriden");

            });

        });
    }

}
