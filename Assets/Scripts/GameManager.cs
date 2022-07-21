using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{

    public GameObject[] karakterIslemleri;

    public GameObject[] karakterHavuzu;
    public int anlikKarakterSayisi = 1;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.A))
        {
            //Instantiate(karakterIslemleri[1],karakterIslemleri[2].transform.position, Quaternion.identity);

            foreach (var item in karakterHavuzu)
            {
                if (!item.activeInHierarchy)
                {
                    item.transform.position = karakterIslemleri[2].transform.position;
                    item.SetActive(true);
                    anlikKarakterSayisi++;
                    break;
                }
            }
        }
        
    }
}
