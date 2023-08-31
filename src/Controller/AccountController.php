<?php

namespace App\Controller;

use App\Form\VideoType;
use App\Entity\Video;
use App\Repository\VideoRepository;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\UserFormType;

class AccountController extends AbstractController
{
    #[Route('/account', name: 'app_account')]
    public function show( VideoRepository $videoRepository, Request $request, PaginatorInterface $paginator): Response
    {
        if (!$this->getUser()) {
            $this->addFlash("error","Vous n'avez pas de compte veiller créer un compte");
           return $this->redirectToRoute('app_register');
       }

        $videos = $paginator->paginate(
            $videoRepository->findAll(), /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
        );
        return $this->render('account/show.html.twig', [
            'videos' => $videos,
            
        ]);
    }


#[Route('/account/edit', name: 'app_account_edit', methods:["GET","POST"])]
public function edit(Request $request, EntityManagerInterface $em): Response{
    $user=$this->getUser();
    $form = $this->createForm(UserFormType::class, $user);
    $form->handleRequest($request);
    if($form->isSubmitted() && $form->isValid()){
    $em->flush();
    $this->addFlash('success', 'Compte modifié avec success!');
    return $this->redirectToRoute('app_account');
    }
    return $this->render('account/edit.html.twig', [
    'user' => $user,
    'userForm' => $form->createView()
    ]);
    }
}
