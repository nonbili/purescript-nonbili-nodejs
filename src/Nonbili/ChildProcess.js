const util = require("util");
const exec = util.promisify(require("child_process").exec);

exports.exec_ = cmd =>
  async function() {
    return await exec(cmd);
  };
