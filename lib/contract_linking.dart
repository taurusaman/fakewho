import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545";//jaha par contract deployed hai
  final String _wsUrl = "ws://127.0.0.1:7545";//uska websocket url
  final String _privatekey =
      "0xa0324b64d473408bc2452c52f33cd01a4cbffb92506b91888a406cdc052150b2";//us deployed mainnet ya testnet ka private key

  Web3Client? _web3client;//ye blochchain(node) se bat karega flutter app se
  bool isLoading = true;
  String? _abicode;//ye read karega abi se hamare contract ko
  EthereumAddress? _contractAddress;//jo bhi deploy karenge contract ko uska adress
  Credentials? _credentials;//deployer ke credentials
  DeployedContract? _contract;//web3 dart library will tell us that where is our contract is deployed
  ContractFunction? _message;//variable jo hamne helloworld.sol me banaya hai
  ContractFunction? _setmessage;//function variable of helloworld.sol file
  String? deployedName;//smart contract ka nam kya hai?

//constructor hai aur uske andar setup nam ka method hai
  ContractLinking() {
    setup();
  }

  setup() async {
    _web3client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });//hamne instantiate kar diyaa web3client ko

    await getAbi();
    await getCredential();
    await getDeployedContract();
  }
//get ABI
  Future<void> getAbi() async {
    String abisStringFile =
        await rootBundle.loadString('build/contracts/ProductVerification.json');

    final jsonAbi = jsonDecode(abisStringFile);
    _abicode = jsonEncode(jsonAbi['abi']);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi['network']['5777']['address']);
  }
//Get Credential
  Future<void> getCredential() async {
    _credentials = EthPrivateKey.fromHex(_privatekey);
  }
//Get DeployedContract
  Future<void> getDeployedContract() async {
    {  //ye deployedcontract ek class hai
      _contract = DeployedContract(
          ContractAbi.fromJson(_abicode!, "HelloWorld"), _contractAddress!);

      _message = _contract!.function("message");
      _setmessage = _contract!.function("setMessage");
      getMessage();
    }
  }

  getMessage() async {
    final _mymessage = await _web3client!
        .call(contract: _contract!, function: _message!, params: []);
        
    deployedName = _mymessage[0];
    isLoading = false;
    notifyListeners();//notifying
  }

  setMessage(String message) async {
    isLoading = true;
    notifyListeners();//notifying ki ham log changes kar rhe hai
    await _web3client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _setmessage!,
            parameters: [message]));

    getMessage();
  }
}
