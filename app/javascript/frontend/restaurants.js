import axios from 'axios'
console.log('rrrrestaurants.js')
document.addEventListener('DOMContentLoaded', () => {
    let likeBtn = document.querySelector('#like-btn');

    if(likeBtn){
        let ax = axios.create()
        let token = document.querySelector('meta[name=csrf-token]').content;
        ax.defaults.headers.common['X-CSRF-Token'] = token;
        likeBtn.addEventListener('click',()=>{
            console.log(token);
            ax.post('/restaurants/33/pocket_list')
            .then(res =>{
                console.log(res.data)
            })
            .catch(err => {
                console.log(err)
            })
          })
    }
   
})