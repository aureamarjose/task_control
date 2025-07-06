import { Controller } from "@hotwired/stimulus"
import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static targets = ["inputSearch", "results", "table", "clientId"]
  static debounces = ["search"]
  static values = {
    url: String,
    name: String
  }

  connect() {
    console.log('search', this.urlValue, this.nameValue)
    useDebounce(this, { wait: 1000 })
  }

  search() {
    const searchValue = this.inputSearchTarget.value;
    const url = `${this.urlValue}=${encodeURIComponent(searchValue)}`
    console.log("url", url)

    // Se searchValue for vazio, retorne imediatamente
    if (!searchValue.trim()) {
      this.resultsTarget.innerHTML = ""
      return;
    }

    fetch(url, {
      method: 'GET',
    })
      .then(response => response.json())
      .then(data => {
        console.log(data)
        if (data.length == 0) {
          this.resultsTarget.innerHTML = '<p class="block w-full text-center text-blue-500 dark:text-gray-400">Nenhuma collaborador encontrado.</p>';
          return;
        }
        this.resultsTarget.innerHTML = '';
        data.forEach(name => {
          const element = document.createElement('a');
          element.href = '#';
          element.className = 'block w-full px-4 py-2 border-b border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white dark:focus:ring-gray-500 dark:focus:text-white';

          element.addEventListener('click', this.handleClientClick.bind(this));
          if (this.nameValue == "name") {
            element.textContent = name.name;
            element.dataset.name = name.name;
          } else if (this.nameValue == "property_ccir") {
            element.textContent = name.property_ccir;
            element.dataset.name = name.property_ccir;
          } else if (this.nameValue == "property_register") {
            element.textContent = name.property_register;
            element.dataset.name = name.property_register;
          }

          this.resultsTarget.appendChild(element);
        });
      })

      .catch((error) => {
        console.error('Error:', error)
      });
  }

  handleClientClick(event) {
    event.preventDefault()
    const name = event.currentTarget.dataset.name
    this.inputSearchTarget.value = name
    this.resultsTarget.innerHTML = ""
  }

}