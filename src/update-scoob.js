const fs = require("fs");
const crypto = require("crypto");
const path = require("path");
const axios = require("axios");
const https = require("https");
const handlebars = require("handlebars");
const { VERSION } = process.env;

const templateSource = fs.readFileSync(
  path.join(__dirname, "template.rb"),
  "utf8"
);
const template = handlebars.compile(templateSource);

if (!VERSION) {
  console.error("Expected a `VERSION` environment variable to be set.");
  process.exit(1);
}

function getChecksum(url) {
  return new Promise(async (resolve, reject) => {
    const hash = crypto.createHash("sha256");
    const res = await axios.get(url, { responseType: "stream" });

    res.data.on("error", (err) => {
      reject(err);
    });

    res.data.on("data", (data) => {
      hash.update(data);
    });

    res.data.on("close", () => {
      resolve(hash.digest("hex"));
    });
  });
}

(async () => {
  const MAC_URL = `https://github.com/HostyHosting/scoob/releases/download/${VERSION}/scoob-x86_64-apple-darwin.zip`;
  const MAC_URL_ARM = `https://github.com/HostyHosting/scoob/releases/download/${VERSION}/scoob-aarch64-apple-darwin.zip`;
  const LINUX_URL = `https://github.com/HostyHosting/scoob/releases/download/${VERSION}/scoob-x86_64-unknown-linux-gnu.zip`;
  const LINUX_URL_ARM = `https://github.com/HostyHosting/scoob/releases/download/${VERSION}/scoob-aarch64-unknown-linux-gnu.zip`;

  const MAC_SHA = await getChecksum(MAC_URL);
  const MAC_SHA_ARM = await getChecksum(MAC_URL_ARM);
  const LINUX_SHA = await getChecksum(LINUX_URL);
  const LINUX_SHA_ARM = await getChecksum(LINUX_URL_ARM);

  fs.writeFileSync(
    path.join(__dirname, "..", "Formula", "scoob.rb"),
    template({
      // Remove the "v" from the version:
      VERSION: VERSION.slice(1),
      MAC_URL,
      MAC_SHA,
      MAC_URL_ARM,
      MAC_SHA_ARM,
      LINUX_URL,
      LINUX_SHA,
      LINUX_URL_ARM,
      LINUX_SHA_ARM,
    })
  );
})();
