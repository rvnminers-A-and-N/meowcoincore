'use strict';

var should = require('chai').should();
var meowcoincore = require('../');

describe('Library', function() {
  it('should export primatives', function() {
    should.exist(meowcoincore.crypto);
    should.exist(meowcoincore.encoding);
    should.exist(meowcoincore.util);
    should.exist(meowcoincore.errors);
    should.exist(meowcoincore.Address);
    should.exist(meowcoincore.Block);
    should.exist(meowcoincore.MerkleBlock);
    should.exist(meowcoincore.BlockHeader);
    should.exist(meowcoincore.HDPrivateKey);
    should.exist(meowcoincore.HDPublicKey);
    should.exist(meowcoincore.Networks);
    should.exist(meowcoincore.Opcode);
    should.exist(meowcoincore.PrivateKey);
    should.exist(meowcoincore.PublicKey);
    should.exist(meowcoincore.Script);
    should.exist(meowcoincore.Transaction);
    should.exist(meowcoincore.URI);
    should.exist(meowcoincore.Unit);
  });
});
