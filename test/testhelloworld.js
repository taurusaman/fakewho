
const HelloWorld = artifacts.require('HelloWorld');

contract("HelloWorld", () => {
    it ("Testing", async () => {
        const instance = await HelloWorld.deployed();
        await instance.setmessage("Hello PK");
        const message = await instance.message();
        assert(message == "Hello PK");
    })
})