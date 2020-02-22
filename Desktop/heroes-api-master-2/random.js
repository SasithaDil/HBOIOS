console.log("1. I will be executed first");

function doAsyncWork() {
  return new Promise(function(resolve, reject) {
    setTimeout(() => {
      console.log("2. Doing something in a timer...");
      resolve("Asynchronous result");
    }, 6000);
  });
}

async function GetAsyncResults() {
  try {
    let asyncresult = await doAsyncWork();
    console.log("3. I am second :  " + asyncresult);
  } catch (err) {
    console.log(err);
  }
}

GetAsyncResults();

console.log("4. Doing other works");
