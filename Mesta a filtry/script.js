document.addEventListener("DOMContentLoaded", () => {
    const searchInput = document.querySelector('#search\\ bar'); 
    const tableRows = document.querySelectorAll("table tr:not(:first-child)"); 

    searchInput.addEventListener("input", () => {
        const query = searchInput.value.toLowerCase().trim();

        tableRows.forEach(row => {
            const cityCell = row.cells[1]; 
            if (cityCell) {
                const cityName = cityCell.textContent.toLowerCase();
                row.style.display = cityName.includes(query) ? "" : "none";
            }
        });
    });
});


document.addEventListener("DOMContentLoaded", () => {
    const filterInput = document.querySelector('#filter-select');
    const select = document.querySelector('#city-select');
    const originalOptions = Array.from(select.options);

    filterInput.addEventListener("input", () => {
        const query = filterInput.value.toLowerCase().trim();
        select.innerHTML = "";

        originalOptions.forEach(option => {
            if (option.text.toLowerCase().includes(query)) {
                select.appendChild(option);
            }
        });
    });
});
