using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor.AI;

public class characterController : MonoBehaviour
{
    public Animator anm;
    public float speed;


    private float ileri;
    private float yanlar;
    private GameObject groundLeftBorder;
    private GameObject groundRightBorder;
    private Collider pCollider, rBorderCollider, lBorcerCollider;
   

    // Start is called before the first frame update
    void Awake()
    {
        anm = this.GetComponent<Animator>();
        groundRightBorder = GameObject.FindWithTag("zeminSagCollider");
        groundLeftBorder = GameObject.FindWithTag("zeminSolCollider");
        pCollider = GetComponent<Collider>();
        
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(Vector3.forward * Time.deltaTime * speed);
        anm.SetBool("Run", true);





        #region Harekt kodları

        if (Input.GetKey(KeyCode.Mouse0))
        {
            if (Input.GetAxisRaw("Mouse X") > 0)
            {
                transform.position = Vector3.Lerp(transform.position, new Vector3(transform.position.x +.1f, transform.position.y, transform.position.z), .3f);
                
            }
            else if (Input.GetAxisRaw("Mouse X") < 0)
            {
                transform.position = Vector3.Lerp(transform.position, new Vector3(transform.position.x - .1f, transform.position.y, transform.position.z), .3f);
            }
        }


        //ileri = Input.GetAxisRaw("Vertical");
        //yanlar = Input.GetAxisRaw("Horizontal");


        //if (ileri > 0.01)
        //{
        //    transform.Translate(Vector3.forward * Time.deltaTime * speed);
        //    anm.SetBool("Run", true);

        //}
        //else if (ileri < 0)
        //{
        //    transform.Translate(Vector3.back * Time.deltaTime);
        //    anm.SetBool("RunBack", true);
        //}
        //else if (yanlar > 0.01)
        //{
        //    transform.Translate(Vector3.right * Time.deltaTime * speed);
        //}
        //else if (yanlar < 0)
        //{
        //    transform.Translate(Vector3.left * Time.deltaTime * speed);
        //}
        //else
        //{
        //    anm.SetBool("Run", false);
        //    anm.SetBool("RunBack", false);
        //}
        #endregion

    }

    
}
