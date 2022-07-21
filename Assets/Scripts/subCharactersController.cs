using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class subCharactersController : MonoBehaviour
{
    float speed = 2f;
    Animator anm;
    GameObject target;
    NavMeshAgent _navmesh;
    GameObject _gameManager;

    // Start is called before the first frame update
    void Start()
    {
        anm = GetComponent<Animator>();
        _navmesh = GetComponent<NavMeshAgent>();
        target = GameObject.FindWithTag("GameManager").GetComponent<GameManager>().karakterIslemleri[3];
        _gameManager = GameObject.FindWithTag("GameManager");
       
    }

    // Update is called once per frame
    private void LateUpdate()
    {
        _navmesh.SetDestination(target.transform.position);
        transform.Translate(Vector3.forward * Time.deltaTime * speed);
        anm.SetBool("Run", true);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("igneliKutu"))
        {
            _gameManager.GetComponent<GameManager>().anlikKarakterSayisi--;
            gameObject.SetActive(false);
        }
    }
}
