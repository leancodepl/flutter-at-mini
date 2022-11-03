async function myFunc() {
	console.log("\tBefore delay");
	await new Promise(resolved => setTimeout(resolved, 500));
	console.log("\tAfter delay");
}

async function main() {
	console.log("Before call");
	var prom = myFunc();
	console.log("After call");
	await prom;
	console.log("After await");
}

main()
