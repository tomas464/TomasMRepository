const fileInput = document.getElementById('fileInput');
const fileStatus = document.getElementById('fileStatus');
const fileContent = document.getElementById('fileContent');
const certKey = document.getElementById('certKey');
const signAndDownloadBtn = document.getElementById('signAndDownloadBtn');
const signStatus = document.getElementById('signStatus');
const signedContent = document.getElementById('signedContent');

let originalText = "";

// Načtení souboru
fileInput.addEventListener('change', () => {
    const file = fileInput.files[0];

    if (!file) {
        fileStatus.textContent = "Žádný soubor není nahrán.";
        fileContent.value = "";
        originalText = "";
        signAndDownloadBtn.disabled = true;
        return;
    }

    const reader = new FileReader();
    reader.onload = e => {
        originalText = e.target.result;
        fileContent.value = originalText;
        fileStatus.textContent = "Soubor načten: " + file.name;
        signAndDownloadBtn.disabled = false;
    };
    reader.readAsText(file, "UTF-8");
});

// SHA‑1 funkce (browser crypto)
async function sha1(message) {
    const encoder = new TextEncoder();
    const data = encoder.encode(message);
    const hashBuffer = await crypto.subtle.digest("SHA-1", data);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    return hashArray.map(b => b.toString(16).padStart(2, "0")).join("");
}

// Podepsat a stáhnout
signAndDownloadBtn.addEventListener('click', async () => {
    const key = certKey.value; // ← HEX KEY

    if (!key) {
        signStatus.textContent = "Vyber podpis.";
        return;
    }

    signStatus.textContent = "Podepisuji...";
    signedContent.value = "";

    const hash = await sha1(originalText + "\n" + key);

    const signedText =
        rtrim(originalText) +
        "\n\n---SIGNATURE---\n" +
        "KEY: " + key + "\n" +
        "HASH: " + hash + "\n";

    signedContent.value = signedText;
    signStatus.textContent = "Soubor byl úspěšně podepsán.";

    // Stáhnout
    const blob = new Blob([signedText], { type: "text/plain;charset=utf-8" });
    const url = URL.createObjectURL(blob);

    const a = document.createElement("a");
    a.href = url;
    a.download = "podepsany.txt";
    a.click();

    URL.revokeObjectURL(url);
});

// Odstranění koncových newline
function rtrim(str) {
    return str.replace(/[\r\n]+$/, "");
}
