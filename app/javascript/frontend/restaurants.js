import xxx from 'axios'
console.log('rrrrestaurants.js')
document.addEventListener('DOMContentLoaded', () => {
    let likeBtn = document.querySelector('#like-btn');

    if(likeBtn){
        let ax = xxx.create()
        likeBtn.addEventListener('click',()=>{
            
            console.log(ax);
          })
    }
   
})